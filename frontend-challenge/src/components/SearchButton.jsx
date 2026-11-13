import { Component } from 'react';

class SearchButton extends Component {
  render() {
    const { onClick, children } = this.props;

    return (
      <span className="search-button" onClick={onClick}>
        {children}
      </span>
    );
  }
}

export default SearchButton;
