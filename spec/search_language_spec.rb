require 'search_language'

describe SearchLanguage do
  let(:data) do [{
    "Name" => "BASIC",
    "Type" => "Imperative, Compiled, Procedural, Interactive mode, Interpreted",
    "Designed by" => "John George Kemeny, Thomas Eugene Kurtz"
    }]
  end

  describe ".execute" do

    context "given author name" do
      it "return language name" do
        expect(SearchLanguage.new(data, 'Thomas').execute).to eq(["BASIC"])
      end
    end

    context "given author first mane and last name" do
      it "return language name" do
        expect(SearchLanguage.new(data, 'Thomas Kurtz').execute).to eq(["BASIC"])
      end
    end

    context "given language type author first name and last name" do
      it "return language name" do
        expect(SearchLanguage.new(data, 'Compiled "Thomas Kurtz"').execute).to eq(["BASIC"])
      end
    end

    context "given downcase language type author first and last name" do
      it "return language name" do
        expect(SearchLanguage.new(data, 'compiled "thomas kurtz"').execute).to eq(["BASIC"])
      end
    end

    context "given not full author name" do
      it "return empty array" do
        expect(SearchLanguage.new(data, 'Thom').execute).to eq([])
      end
    end
  end
end
