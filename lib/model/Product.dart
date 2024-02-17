class Product {
  final String imageUrl;
  final String title;
  final String price;

  Product({required this.imageUrl, required this.title, required this.price});
}

List<Product> loadProducts = [
  Product(
      imageUrl:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fe%2Fee%2FChain_link_icon.png&tbnid=mj2OmSHS0LnkzM&vet=12ahUKEwiY2cS5pLKEAxWnY6QEHdP6AF8QMygAegQIARB0..i&imgrefurl=https%3A%2F%2Fsimple.m.wikipedia.org%2Fwiki%2FFile%3AChain_link_icon.png&docid=vaqxamEs3kiypM&w=950&h=400&q=image%20link&ved=2ahUKEwiY2cS5pLKEAxWnY6QEHdP6AF8QMygAegQIARB0',
      title: 'title',
      price: 'price'),
  Product(
      imageUrl:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fe%2Fee%2FChain_link_icon.png&tbnid=mj2OmSHS0LnkzM&vet=12ahUKEwiY2cS5pLKEAxWnY6QEHdP6AF8QMygAegQIARB0..i&imgrefurl=https%3A%2F%2Fsimple.m.wikipedia.org%2Fwiki%2FFile%3AChain_link_icon.png&docid=vaqxamEs3kiypM&w=950&h=400&q=image%20link&ved=2ahUKEwiY2cS5pLKEAxWnY6QEHdP6AF8QMygAegQIARB0',
      title: 'title',
      price: 'price'),
  Product(
      imageUrl:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fe%2Fee%2FChain_link_icon.png&tbnid=mj2OmSHS0LnkzM&vet=12ahUKEwiY2cS5pLKEAxWnY6QEHdP6AF8QMygAegQIARB0..i&imgrefurl=https%3A%2F%2Fsimple.m.wikipedia.org%2Fwiki%2FFile%3AChain_link_icon.png&docid=vaqxamEs3kiypM&w=950&h=400&q=image%20link&ved=2ahUKEwiY2cS5pLKEAxWnY6QEHdP6AF8QMygAegQIARB0',
      title: 'title',
      price: 'price'),
  Product(
      imageUrl:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fe%2Fee%2FChain_link_icon.png&tbnid=mj2OmSHS0LnkzM&vet=12ahUKEwiY2cS5pLKEAxWnY6QEHdP6AF8QMygAegQIARB0..i&imgrefurl=https%3A%2F%2Fsimple.m.wikipedia.org%2Fwiki%2FFile%3AChain_link_icon.png&docid=vaqxamEs3kiypM&w=950&h=400&q=image%20link&ved=2ahUKEwiY2cS5pLKEAxWnY6QEHdP6AF8QMygAegQIARB0',
      title: 'title',
      price: 'price'),
  Product(
      imageUrl:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fe%2Fee%2FChain_link_icon.png&tbnid=mj2OmSHS0LnkzM&vet=12ahUKEwiY2cS5pLKEAxWnY6QEHdP6AF8QMygAegQIARB0..i&imgrefurl=https%3A%2F%2Fsimple.m.wikipedia.org%2Fwiki%2FFile%3AChain_link_icon.png&docid=vaqxamEs3kiypM&w=950&h=400&q=image%20link&ved=2ahUKEwiY2cS5pLKEAxWnY6QEHdP6AF8QMygAegQIARB0',
      title: 'title',
      price: 'price'),
  Product(
      imageUrl:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fe%2Fee%2FChain_link_icon.png&tbnid=mj2OmSHS0LnkzM&vet=12ahUKEwiY2cS5pLKEAxWnY6QEHdP6AF8QMygAegQIARB0..i&imgrefurl=https%3A%2F%2Fsimple.m.wikipedia.org%2Fwiki%2FFile%3AChain_link_icon.png&docid=vaqxamEs3kiypM&w=950&h=400&q=image%20link&ved=2ahUKEwiY2cS5pLKEAxWnY6QEHdP6AF8QMygAegQIARB0',
      title: 'title',
      price: 'price'),
  Product(
      imageUrl:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fe%2Fee%2FChain_link_icon.png&tbnid=mj2OmSHS0LnkzM&vet=12ahUKEwiY2cS5pLKEAxWnY6QEHdP6AF8QMygAegQIARB0..i&imgrefurl=https%3A%2F%2Fsimple.m.wikipedia.org%2Fwiki%2FFile%3AChain_link_icon.png&docid=vaqxamEs3kiypM&w=950&h=400&q=image%20link&ved=2ahUKEwiY2cS5pLKEAxWnY6QEHdP6AF8QMygAegQIARB0',
      title: 'title',
      price: 'price'),
  Product(
      imageUrl:
          'https://www.google.com/imgres?imgurl=https%3A%2F%2Fupload.wikimedia.org%2Fwikipedia%2Fcommons%2Fe%2Fee%2FChain_link_icon.png&tbnid=mj2OmSHS0LnkzM&vet=12ahUKEwiY2cS5pLKEAxWnY6QEHdP6AF8QMygAegQIARB0..i&imgrefurl=https%3A%2F%2Fsimple.m.wikipedia.org%2Fwiki%2FFile%3AChain_link_icon.png&docid=vaqxamEs3kiypM&w=950&h=400&q=image%20link&ved=2ahUKEwiY2cS5pLKEAxWnY6QEHdP6AF8QMygAegQIARB0',
      title: 'title',
      price: 'price'),
];
