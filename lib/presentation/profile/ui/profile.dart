import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:oyinshyq/app/data/models/profile.dart';
import 'package:oyinshyq/base/base_provider.dart';
import 'package:oyinshyq/presentation/profile/provider/profile_provider.dart';
import 'package:oyinshyq/presentation/profile/ui/change_profile.dart';
import 'package:oyinshyq/presentation/profile/ui/payment.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // var myUser = User(
  //     imagePath: 'assets/images/png/maveric.jpg',
  //     name: 'Didar',
  //     phone: '+7 707 934 58 25',
  //     about:
  //         'Certified Personal Trainer and Nutritionist with years of experience in creating effective diets and training plans focused on achieving individual customers goals in a smooth way.');

  @override
  Widget build(BuildContext context) {
    // final user = myUser;

    return BaseProvider<ProfileProvider>(
      model: ProfileProvider(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: buildAppBar(context),
          body: ListView(
            physics: BouncingScrollPhysics(),
            children: [
              ProfileWidget(
                imagePath: model.user.imagePath!,
                onClicked: () async {},
              ),
              const SizedBox(height: 24),
              buildName(model.user),
              const SizedBox(height: 24),
              buildOtherInfo(model)
            ],
          ),
        );
      },
    );
  }

  buildOtherInfo(ProfileProvider model) {
    final user = model.user;
    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.post_add,
            size: 27,
          ),
          title: Text(
            'Доставка',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        Divider(),
        GestureDetector(
          onTap: () {},
          child: ListTile(
            leading: Icon(
              Icons.post_add,
              size: 27,
            ),
            title: Text(
              'Пункты выдачи заказов',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Divider(),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Payment()));
          },
          child: ListTile(
            leading: Icon(
              Icons.post_add,
              size: 27,
            ),
            title: Text(
              'Способы оплаты',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.post_add,
            size: 27,
          ),
          title: Text(
            'Возврат товара',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.post_add,
            size: 27,
          ),
          title: Text(
            'Возврат средств',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.post_add,
            size: 27,
          ),
          title: Text(
            'О нас',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.post_add,
            size: 27,
          ),
          title: Text(
            'О приложении',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        Divider(),
        ListTile(
          leading: Icon(
            Icons.post_add,
            size: 27,
          ),
          title: Text(
            'Контакты',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        Divider(),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ChangeProfile(
                          img: user.imagePath,
                          name: user.name,
                          phone: user.phone,
                          about: user.about,
                          profileProvider: model,
                        )));
          },
          child: ListTile(
            leading: Icon(
              Icons.post_add,
              size: 27,
            ),
            title: Text(
              'Изменить профиль',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.name!,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            user.phone!,
            style: TextStyle(color: Colors.grey),
          )
        ],
      );
}

AppBar buildAppBar(BuildContext context) {
  final icon = CupertinoIcons.moon_stars;

  return AppBar(
    leading: BackButton(),
    backgroundColor: Colors.transparent,
    elevation: 0,
    actions: [
      IconButton(
        icon: Icon(icon),
        onPressed: () {},
      ),
    ],
  );
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          onPrimary: Colors.white,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
        ),
        child: Text(text),
        onPressed: onClicked,
      );
}

class ProfileWidget extends StatelessWidget {
  final String imagePath;
  final VoidCallback onClicked;

  const ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.onClicked,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    return Center(
      child: Stack(
        children: [
          buildImage(),
          Positioned(
            bottom: 0,
            right: 4,
            child: buildEditIcon(color),
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    final image = AssetImage(imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClicked),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 8,
          child: Icon(
            Icons.edit,
            color: Colors.white,
            size: 20,
          ),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}
