# # from flask import Flask, request, jsonify, render_template,redirect,url_for
# # import json
# # app = Flask(__name__)


# # @app.route('/')
# # def form():
# #     return render_template('form.html')


# # @app.route('/form-submission', methods=['POST'])
# # def form_submission():
# #     name = request.form['name']
# #     email = request.form['email']
# #     password = request.form['password']

# #     with open('users.txt', 'a') as file:
# #         user = {'name': name, 'email': email, 'password': password}
# #         json.dump(user, file)
# #         file.write('\n')
# #     return redirect(url_for('get_user_data'))


# # @app.route('/data', methods=['GET'])
# # def get_user_data():
# #     with open('users.txt', 'r') as file:
# #         users = [json.loads(line) for line in file]
# #         return render_template('users.html', users=users)


# # # checking for errors
# # if __name__ == '__main__':
# #     app.run(debug=True)


# from flask import Flask, request, jsonify, render_template, redirect, url_for
# import json

# app = Flask(__name__)

# @app.route('/')
# def form():
#     return render_template('form.html')

# @app.route('/form-submission', methods=['POST'])
# def form_submission():
#     name = request.form['name']
#     email = request.form['email']
#     password = request.form['password']

#     with open('users.txt', 'a') as file:
#         user = {'name': name, 'email': email, 'password': password}
#         json.dump(user, file)
#         file.write('\n')

#     return redirect(url_for('get_user_data'))

# @app.route('/users')
# def get_user_data():
#     with open('users.txt', 'r') as file:
#         users = [json.loads(line) for line in file]

#     return render_template('users.html', users=users)

# if __name__ == '__main__':
#     app.run(debug=True)


from flask import Flask, request, jsonify, render_template
import json

app = Flask(__name__)


@app.route('/', methods=['GET', 'POST'])
def registration():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        password = request.form['password']
        with open('users.txt', 'a') as file:
            user = {'name': name, 'email': email, 'password': password}
            file.write(json.dumps(user) + '\n')
        return render_template('users.html', users=[user])
    else:
        return render_template('form.html')


@app.route('/users', methods=['GET'])
def users():
    with open('users.txt', 'r') as file:
        users = [json.loads(line) for line in file]
    return render_template('users.html', users=users)


if __name__ == '__main__':
    app.run(debug=True)
