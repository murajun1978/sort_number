require 'number'

describe Number do
  let(:number){Number.new(arg)}

  describe "sort is successful" do
    context "argument is '3 2 1'" do
      let(:arg){"3 2 1\n"} 
      it "returns '1 2 3'" do
        expect(number.ascending).to eq "1 2 3"
      end
    end

    context "argument is '３ ２ １'" do
      let(:arg){"３ ２ １\n"}
      it "returns '1 2 3'" do
        expect(number.ascending).to eq "1 2 3"
      end
    end

    context "argument is '３　２　１'" do
      let(:arg){"３　２　１\n"}
      it "returns '1 2 3'" do
        expect(number.ascending).to eq "1 2 3"
      end
    end
  end

  describe "an error occurs" do
    context "When the non-numeric arguments that contain" do
      context "argument is 'e b 1'" do
        let(:arg){"e b 1\n"}
        it "has raise error" do
          expect{ number.ascending }.to raise_error
        end
      end

      context "argument is 'え い あ'" do
        let(:arg){"え い あ"}
        it "has raise error" do
          expect{ number.ascending }.to raise_error
        end
      end
    end

    context "When the argument is less" do
      let(:arg){"1 3\n"}
      it "has raise error" do
        expect{ number.ascending }.to raise_error
      end
    end
  end
end
