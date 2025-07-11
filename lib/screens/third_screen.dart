import 'package:flutter/material.dart';
import 'package:km_test/providers/user_provider.dart';
import 'package:provider/provider.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    if (userProvider.users.isEmpty) {
      userProvider.fetchUsers();
    }

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        userProvider.fetchUsers();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Third Screen'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Consumer<UserProvider>(
        builder: (context, userProvider, child) {
          if (userProvider.users.isEmpty && userProvider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (userProvider.users.isEmpty) {
            return const Center(child: Text('No users found.'));
          }

          return RefreshIndicator(
            onRefresh: userProvider.refreshUsers,
            child: ListView.builder(
              controller: _scrollController,
              itemCount:
                  userProvider.users.length + (userProvider.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == userProvider.users.length) {
                  return const Center(child: CircularProgressIndicator());
                }

                final user = userProvider.users[index];
                return Column(
                  children: [
                    ListTile(
                      leading:  CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.grey[200],
                        child: ClipOval(
                          child: Image.network(
                            user.avatar,
                            fit: BoxFit.cover,
                            width: 50,
                            height: 50,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.person,
                                color: Colors.grey,
                                size: 50,
                              );
                            },
                            loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.0,
                                  value: loadingProgress.expectedTotalBytes != null
                                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      title: Text(
                        user.fullName,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        user.email.toUpperCase(),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        userProvider.setSelectedUserName(user.fullName);
                        Navigator.pop(context);
                      },
                    ),
                    const Divider(height: 1, indent: 20, endIndent: 20),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
