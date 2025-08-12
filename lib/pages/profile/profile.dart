import 'package:flutter/material.dart';
import 'package:shop_app/utils/snacbar.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: Colors.green,
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.green,
            padding: const EdgeInsets.symmetric(vertical: 30),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?img=12",
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Gendi Telamdika",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "gendi@example.com",
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),

          const SizedBox(height: 10),

          Card(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                _buildMenuItem(
                  icon: Icons.shopping_bag_outlined,
                  title: "My Order",
                  onTap: () {
                    showFeatureNotAvailable(context);
                  },
                ),
                _buildMenuItem(
                  icon: Icons.local_offer_outlined,
                  title: "Voucher",
                  onTap: () {
                    showFeatureNotAvailable(context);
                  },
                ),
                _buildMenuItem(
                  icon: Icons.favorite_border,
                  title: "Wishlist",
                  onTap: () {
                    showFeatureNotAvailable(context);
                  },
                ),
                _buildMenuItem(
                  icon: Icons.settings_outlined,
                  title: "Setting",
                  onTap: () {
                    showFeatureNotAvailable(context);
                  },
                ),
                _buildMenuItem(
                  icon: Icons.help_outline,
                  title: "Help",
                  onTap: () {
                    showFeatureNotAvailable(context);
                  },
                ),
                _buildMenuItem(
                  icon: Icons.logout,
                  title: "Logout",
                  onTap: () {
                    showFeatureNotAvailable(context);
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          Center(
            child: Text(
              "Versi Aplikasi 1.0.0",
              style: TextStyle(color: Colors.grey[600]),
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.green),
      title: Text(title),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}
