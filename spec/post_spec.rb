describe 'agrupando os metodos de verbo POST' do
 
    it 'Adicionando users' do
        @new_user = {
            name: "Robo",
            email: "robo@robomail.com.br",
            gender: "male",
            status:"active"
        }
        @header = {
            Authorization: "Bearer 9f29328627c8491e442c784b11e1e58e7b4a761519ea0738869bae2177bf413f"
        }
  
        @request = User.post('/users', :body => @new_user, :headers => @header)
        puts @request

        expect(@request["code"]).to eq(201)
        expect(@request["data"]["id"]).not_to be nil
        expect(@request["data"]["name"]).to eq(@new_user[:name])
        expect(@request["data"]["email"]).to eq(@new_user[:email])
        expect(@request["data"]["gender"]).to eq(@new_user[:gender])
        expect(@request["data"]["status"]).to eq(@new_user[:status])

        puts 'Usuário cadastrado'
        puts @request
    end
 end