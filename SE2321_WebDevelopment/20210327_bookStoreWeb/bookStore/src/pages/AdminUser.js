import React from 'react';
import ReactDOM from 'react-dom';
import PropTypes from 'prop-types';
import '../css/Admin.css';
import {Button} from '../components/Button'
import { BrowserRouter} from "react-router-dom" 
import axios from 'axios';

const data = [];
const headers = ["User Id", "user name", "email", "type (0: forbidden  1: Customer 2: Administrator)"];
class Excel extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            data: this.props.initialData,
            sortby: null,
            descending: false,
            edit: null, // [row index, cell index],
            search: false,
            preSearchData: null,
        };
    }

    sort = (e) => {
        let column = e.target.cellIndex;
        let data = this.state.data.slice();
        let descending = this.state.sortby === column && !this.state.descending;
        data.sort(function (a, b) {
            return descending
                ? (a[column] < b[column] ? 1 : -1)
                : (a[column] > b[column] ? 1 : -1);
        });
        this.setState({
            data: data,
            sortby: column,
            descending: descending,
        });
    };

    showEditor = (e) => {
        this.setState({
            edit: {
                row: parseInt(e.target.dataset.row, 10),
                cell: e.target.cellIndex,
            }
        });
    };

    save = (e) => {
        e.preventDefault();
        let input = e.target.firstChild;
        let data = this.state.data.slice();
        data[this.state.edit.row][this.state.edit.cell] = input.value;
    
        if(this.state.edit.cell===3){
          axios({
            method: 'GET',
            url: 'http://localhost:9090/adminUserChange',
            params: {
                user_id:data[this.state.edit.row][0],
                name:data[this.state.edit.row][1],
                email:data[this.state.edit.row][2],
                type:data[this.state.edit.row][3]
            }
        }).then(response => {
            console.log(response);
        })
        }
    };

    toggleSearch = () => {
        if (this.state.search) {
            this.setState({
                data: this.preSearchData,
                search: false,
            });
            this.preSearchData = null;
        } else {
            this.preSearchData = this.state.data;
            this.setState({
                search: true,
            });
        }
    };

    search = (e) => {
        let needle = e.target.value.toLowerCase();
        if (!needle) {
            this.setState({data: this.preSearchData});
            return;
        }
        let idx = e.target.dataset.idx;
        let searchdata = this.preSearchData.filter(function (row) {
            return row[idx].toString().toLowerCase().indexOf(needle) > -1;
        });
        this.setState({data: searchdata});
    };

    download(format, ev) {
        let contents = format === 'json'
            ? JSON.stringify(this.state.data)
            : this.state.data.reduce(function (result, row) {
                return result
                    + row.reduce(function (rowresult, cell, idx) {
                        return rowresult
                            + '"'
                            + cell.replace(/"/g, '""')
                            + '"'
                            + (idx < row.length - 1 ? ',' : '');
                    }, '')
                    + "\n";
            }, '');

        let URL = window.URL || window.webkitURL;
        let blob = new Blob([contents], {type: 'text/' + format});
        ev.target.href = URL.createObjectURL(blob);
        ev.target.download = 'data.' + format;
    };

    getBooks = () => {
        // fetch("http://localhost:8080/se122_10_reactdb_war/BookManager")
        fetch("http://localhost:9090/adminUser")
            .then(response => response.json())
            .then(data => {
                this.setState({
                    data:  data
                });
                
            }).catch(function (ex) {
            console.log('parsing failed', ex);
        })
    }


    render = () => {
        return (
            <div>
                {this.renderToolbar()}
                {this.renderTable()}
            </div>
        );
    };

    renderToolbar = () => {
        return (
            <div className="toolbar">
      <BrowserRouter>
        <Button  buttonStyle='btn--test'  buttonLink='/AdminIndex'> back</Button>
      </BrowserRouter>
                <button onClick={this.getBooks}>Get Users</button>
                <button onClick={this.toggleSearch}>Search</button>
                <a onClick={this.download.bind(this, 'json')}
                   href="data.json">Export JSON</a>
                <a onClick={this.download.bind(this, 'csv')}
                   href="data.csv">Export CSV</a>
                   <button onClick={this.saveBooks}>Save</button>
            </div>
        );
    };

    renderSearch = () => {
        if (!this.state.search) {
            return null;
        }
        return (
            <tr onChange={this.search}>
                {this.props.headers.map(function (ignore, idx) {
                    return <td key={idx}><input type="text" data-idx={idx}/></td>;
                })}
            </tr>
        );
    };

    renderTable = () => {
        return (
            <table>
                <thead onClick={this.sort}>
                <tr>{
                    this.props.headers.map(function (title, idx) {
                        if (this.state.sortby === idx) {
                            title += this.state.descending ? ' \u2191' : ' \u2193';
                        }
                        return <th key={idx}>{title}</th>;
                    }, this)
                }</tr>
                </thead>
                <tbody onDoubleClick={this.showEditor}>
                {this.renderSearch()}
                {this.state.data.map(function (row, rowidx) {
                    return (
                        <tr key={rowidx}>{
                            row.map(function (cell, idx) {
                                let content = cell;
                                let edit = this.state.edit;
                                if (edit && edit.row === rowidx && edit.cell === idx) {
                                    content = (
                                        <form onSubmit={this.save}>
                                            <input type="text" defaultValue={cell}/>
                                        </form>
                                    );
                                }
                                return <td key={idx} data-row={rowidx}>{content}</td>;
                            }, this)}
                        </tr>
                    );
                }, this)}
                </tbody>
            </table>
        );
    }
};

Excel
    .propTypes = {
    headers: PropTypes.arrayOf(
        PropTypes.string
    ),
    initialData: PropTypes.arrayOf(
        PropTypes.arrayOf(
            PropTypes.string
        )
    ),
};

function

AdminUser() {
    return (
        ReactDOM.render(
            React.createElement(Excel, {
                headers: headers,
                initialData: data
            }),
            document.getElementById("root")
        )
    );
}

export default AdminUser;