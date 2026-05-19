import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile {
  final String name;
  final String username;
  final String bio;
  final String avatarUrl;
  final String coverUrl;
  final int posts;
  final int followers;
  final int following;
  final bool isFollowing;

  const UserProfile({
    required this.name,
    required this.username,
    required this.bio,
    required this.avatarUrl,
    required this.coverUrl,
    required this.posts,
    required this.followers,
    required this.following,
    required this.isFollowing,
  });
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // Data statis untuk demo
  static const _user = UserProfile(
    name: 'Yerri Kurnia Febrina',
    username: '@inutfebrina',
    bio:
        'Flutter Developer. Membangun UI yang indah dan performan.\n'
        'Open source contributor. Coffee addict.',
    avatarUrl: 'https://i.pravatar.cc/300?img=12',
    coverUrl: 'https://picsum.photos/seed/cover/800/400',
    posts: 142,
    followers: 8420,
    following: 312,
    isFollowing: false,
  );

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // ── Hero Header dengan SliverAppBar ───────────────
          SliverAppBar(
            expandedHeight: 240,
            pinned: true,
            backgroundColor: cs.surface,
            surfaceTintColor: Colors.transparent,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(_user.coverUrl, fit: BoxFit.cover),
                  // Gradient overlay agar konten di atasnya terbaca
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          cs.surface.withOpacity(0.8),
                        ],
                        stops: const [0.5, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: [
              IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
            ],
          ),

          // ── Konten Profil ─────────────────────────────────
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Avatar, nama, dan tombol aksi
                  _ProfileHeader(user: _user),
                  const SizedBox(height: 16),
                  // Bio
                  Text(_user.bio, style: theme.textTheme.bodyMedium),
                  const SizedBox(height: 20),
                  // Stats (Posts, Followers, Following)
                  _ProfileStats(user: _user),
                  const SizedBox(height: 20),
                  // Tombol Follow & Message
                  _ProfileActions(),
                  const SizedBox(height: 24),
                  // Label 'Postingan'
                  Text(
                    'Postingan',
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 12),
                ],
              ),
            ),
          ),

          // ── Grid Postingan ────────────────────────────────
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate(
                (ctx, i) => _PostThumbnail(index: i),
                childCount: 18,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 4,
                mainAxisSpacing: 4,
              ),
            ),
          ),
          const SliverPadding(padding: EdgeInsets.only(bottom: 24)),
        ],
      ),
    );
  }
}

// Sub-widget: Header profil (avatar + nama + username)
class _ProfileHeader extends StatelessWidget {
  const _ProfileHeader({required this.user});

  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Avatar dengan border
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFFf09433), Color(0xFFbc2a8d), Color(0xFF405de6)],
            ),
          ),
          child: CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(user.avatarUrl),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: Theme.of(
                  context,
                ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 2),
              Text(
                user.username,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// Sub-widget: Stats (Posts, Followers, Following)
class _ProfileStats extends StatelessWidget {
  const _ProfileStats({required this.user});

  final UserProfile user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _StatItem(value: user.posts.toString(), label: 'Postingan'),
        _StatItem(
          value: '${(user.followers / 1000).toStringAsFixed(1)}K',
          label: 'Pengikut',
        ),
        _StatItem(value: user.following.toString(), label: 'Mengikuti'),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  const _StatItem({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Theme.of(context).colorScheme.outline,
          ),
        ),
      ],
    );
  }
}

// Sub-widget: Tombol aksi
class _ProfileActions extends StatefulWidget {
  @override
  State<_ProfileActions> createState() => _ProfileActionsState();
}

class _ProfileActionsState extends State<_ProfileActions> {
  bool _isFollowing = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _isFollowing
              ? OutlinedButton(
                  onPressed: () => setState(() => _isFollowing = false),
                  child: const Text('Mengikuti'),
                )
              : FilledButton(
                  onPressed: () => setState(() => _isFollowing = true),
                  child: const Text('Ikuti'),
                ),
        ),

        const SizedBox(width: 8),
        OutlinedButton(onPressed: () {}, child: const Text('Pesan')),
        const SizedBox(width: 8),
        IconButton.outlined(
          onPressed: () {},
          icon: const Icon(Icons.person_add_outlined),
        ),
      ],
    );
  }
}

// Sub-widget: thumbnail foto
class _PostThumbnail extends StatelessWidget {
  const _PostThumbnail({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(4),
      child: Image.network(
        'https://picsum.photos/seed/post$index/200/200',
        fit: BoxFit.cover,
      ),
    );
  }
}
