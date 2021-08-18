describe 'agrupando os metodos de verbo GET' do

    it 'Pesquisa por NAIK' do
        @users = User.get('/users?name=Naik')
        expect(@users.code).to eq(200)
         @users['data'].each do |user|
            expect(user['name']).to include("Naik")
        end
        puts 'Consulta de usuários'
        puts @users
    end

    it 'Consulta de posts por id Usuário' do
        @users = User.get('/users?name=Naik')
        expect(@users.code).to eq(200)
         @user = @users['data'].first
         @posts = User.get("/users/#{@user['id']}/posts")
         expect(@posts.code).to eq(200)
         @posts['data'].each do |post|
            expect(post['user_id']).to eq(@user['id'])
            puts post
        end
        puts 'Consulta de posts'
        puts @posts
    end
end