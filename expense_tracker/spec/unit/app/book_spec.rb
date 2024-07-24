
class BookShelf
    attr_reader :books
    def initialize
        @books = []
    end
    def add(book)
        @books << book
    end
end

RSpec.describe BookShelf do
    # menggunakan hook before akan menyebabkan 'example' untuk melibatkan semua variable yang ada di dalam block hook before. Permasalahannya tidak semua variable yang ada di block itu digunakan oleh setiap 'example'.
    before do
        @book1 = {author: 'Riansyah', title: 'Filsafat Jerman'}
        @book2 = {author: 'Bio', title: 'Kemajuan Cina'}
    end
    let(:new_shelf) { BookShelf.new}

    def second_shelf 
        @second_shelf ||= BookShelf.new
    end
    
    it 'should have only adding one book' do
        new_shelf.add(@book1)
        expect(new_shelf.books.length).to eq(1)
    end

    it 'should have only one books again, even we add more books' do
        new_shelf.add(@book2)
        expect(new_shelf.books.length).not_to eq(2)
    end

    it 'should have only adding one book by using helper' do
        second_shelf.add(@book1)
        expect(second_shelf.books.length).to eq(1)
    end

    it 'should become only one books in the shelf by using helper' do
        second_shelf.add(@book2)
        expect(second_shelf.books[0][:title]).to eq('Kemajuan Cina')
        expect(second_shelf.books.length).to eq(1)
    end
end