package com.echo.bookstorebackend.entity;

public class Book {
    private int bookId;
    private String isbn;
    private String name;
    private String type;
    private String author;
    private Double price;
    private String description;
    private Integer inventory;
    private String image;
    public Book() {
        super();
    }

    public Book(int bookId, String isbn, String name, String type, String author, Double price, String description, Integer inventory, String image) {
        this.bookId = bookId;
        this.isbn = isbn;
        this.name = name;
        this.type = type;
        this.author = author;
        this.price = price;
        this.description = description;
        this.inventory = inventory;
        this.image = image;
    }

    public Book(String isbn, String name, String type, String author, Double price, String description, Integer inventory, String image) {
        this.isbn = isbn;
        this.name = name;
        this.type = type;
        this.author = author;
        this.price = price;
        this.description = description;
        this.inventory = inventory;
        this.image = image;
    }

    public int getBookId() {
        return bookId;
    }

    public String getIsbn() {
        return isbn;
    }

    public String getName() {
        return name;
    }

    public String getType() {
        return type;
    }

    public String getAuthor() {
        return author;
    }

    public Double getPrice() {
        return price;
    }

    public String getDescription() {
        return description;
    }

    public Integer getInventory() {
        return inventory;
    }

    public String getImage() {
        return image;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public void setInventory(Integer inventory) {
        this.inventory = inventory;
    }

    public void setImage(String image) {
        this.image = image;
    }

    @Override
    public String toString() {
        return "Book{" +
                "bookId=" + bookId +
                ", isbn='" + isbn + '\'' +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", author='" + author + '\'' +
                ", price=" + price +
                ", description='" + description + '\'' +
                ", inventory=" + inventory +
                ", image='" + image + '\'' +
                '}';
    }
}
