import React from 'react';
import { Carousel } from 'antd';
export class BookCarousel extends React.Component{

    createContent = (ctx) => {
        const images = ctx.keys().map(ctx);
        console.log(images);
        let result = [];
        for (let i = 0; i < ctx.keys().length; i++) {
            let img = images[i];
            console.log(img);
            result.push(<div><img alt={i} src={img}/></div>);
        }
        return result;
    };

    render(){
        const requireContext = require.context("../assets/carousel", true, /^\.\/.*\.jpg$/);
        // const requireContext = require.context("/Users/kangyixiao/EchoFile/coding/SJTU-SE/SE2321_Web development/20210327_bookStoreWeb/bookStore/public/images", true, /^\.\/.*\.jpg$/);
        // const requireContext = require.context("/Users/kangyixiao/EchoFile/coding/SJTU-SE/SE2321_Web development/20210327_bookStoreWeb/bookStore/public/images/harry2.jpg");
        
        return (
            <Carousel autoplay>
                {this.createContent(requireContext)}
            </Carousel>
        )
    }
}


