import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FlutterKit',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(onPressed: () {}, child: const Text('Fitur')),
          TextButton(onPressed: () {}, child: const Text('Harga')),
          FilledButton(onPressed: () {}, child: const Text('Mulai Gratis')),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            _HeroSection(),
            _FeaturesSection(),
            // _TestimonialsSection(),
            _CTASection(),
            _Footer(),
          ],
        ),
      ),
    );
  }
}

// ── Hero Section ─────────────────────────────────────────
class _HeroSection extends StatelessWidget {
  const _HeroSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isWide = MediaQuery.sizeOf(context).width > 700;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 80),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            theme.colorScheme.primaryContainer.withOpacity(0.3),
            theme.colorScheme.tertiaryContainer.withOpacity(0.2),
          ],
        ),
      ),
      child: isWide
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(flex: 3, child: _HeroText()),
                const SizedBox(width: 48),
                const Expanded(flex: 2, child: _HeroImage()),
              ],
            )
          : const Column(
              children: [_HeroText(), SizedBox(height: 32), _HeroImage()],
            ),
    );
  }
}

class _HeroText extends StatelessWidget {
  const _HeroText();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Badge 'Baru'
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: theme.colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Text(
            'Flutter 3.41 Ready',
            style: theme.textTheme.labelMedium?.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Headline
        Text(
          'Bangun Aplikasi\nImpianmu\nLebih Cepat',
          style: theme.textTheme.displaySmall?.copyWith(
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
        ),
        const SizedBox(height: 16),

        // Deskripsi
        Text(
          'FlutterKit menyediakan komponen UI premium, template screen,'
          ' dan alat developer yang mempercepat development Flutter 10x lipat.',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ),
        const SizedBox(height: 32),
        // CTA Buttons
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            FilledButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.rocket_launch),
              label: const Text('Mulai Gratis'),
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.play_circle_outline),
              label: const Text('Lihat Demo'),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Social proof
        Row(
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 18),
            const SizedBox(width: 4),
            Text(
              '4.9 dari 2.400+ developer',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ],
    );
  }
}

class _HeroImage extends StatelessWidget {
  const _HeroImage();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Image.network(
        'https://picsum.photos/seed/app/600/500',
        fit: BoxFit.cover,
      ),
    );
  }
}

// ── Features Section ──────────────────────────────────────
class _FeaturesSection extends StatelessWidget {
  const _FeaturesSection();

  static const _features = [
    (
      Icons.layers,
      '100+ Komponen',
      'Widget siap pakai dengan dokumentasi lengkap.',
    ),
    (
      Icons.palette,
      'Customizable',
      'Semua komponen bisa disesuaikan dengan brand.',
    ),
    (
      Icons.devices,
      'Responsive',
      'Tampil sempurna di mobile, tablet, dan desktop.',
    ),
    (Icons.speed, 'Performan', 'Dioptimalkan untuk 60FPS di semua device.'),
    (Icons.dark_mode, 'Dark Mode', 'Dukungan light/dark mode yang mulus.'),
    (Icons.code, 'Clean Code', 'Kode bersih mengikuti best practice Flutter.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 60),
      child: Column(
        children: [
          Text(
            'Kenapa FlutterKit?',
            style: Theme.of(
              context,
            ).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Semua yang kamu butuhkan untuk membangun app berkualitas.',
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (ctx, constraints) {
              final cols = (constraints.maxWidth / 280).floor().clamp(1, 3);
              return GridView.count(
                crossAxisCount: cols,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                childAspectRatio: 1.3,
                children: _features
                    .map(
                      (f) => _FeatureCard(
                        icon: f.$1,
                        title: f.$2,
                        description: f.$3,
                      ),
                    )
                    .toList(),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _FeatureCard extends StatelessWidget {
  const _FeatureCard({
    required this.icon,
    required this.title,
    required this.description,
  });

  final IconData icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Card(
      elevation: 0,
      color: cs.surfaceContainerLow,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: cs.primaryContainer,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: cs.onPrimaryContainer, size: 24),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: Theme.of(
                context,
              ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: Theme.of(
                context,
              ).textTheme.bodySmall?.copyWith(color: cs.onSurfaceVariant),
            ),
          ],
        ),
      ),
    );
  }
}

// ── CTA Section ───────────────────────────────────────────
class _CTASection extends StatelessWidget {
  const _CTASection();

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      padding: const EdgeInsets.all(40),
      decoration: BoxDecoration(
        color: cs.primaryContainer,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        children: [
          Text(
            'Siap Memulai?',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: cs.onPrimaryContainer,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'Bergabung dengan 10.000+ developer yang sudah menggunakan FlutterKit.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: cs.onPrimaryContainer.withOpacity(0.8),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          FilledButton(
            onPressed: () {},
            style: FilledButton.styleFrom(
              backgroundColor: cs.primary,
              foregroundColor: cs.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            ),
            child: const Text(
              'Mulai Gratis Sekarang',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Footer ────────────────────────────────────────────────
class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'FlutterKit 2026',
                style: Theme.of(
                  context,
                ).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                'docs.flutter.dev',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Dibangun dengan Flutter. Terima kasih flutter.dev.',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: Theme.of(context).colorScheme.outline,
            ),
          ),
        ],
      ),
    );
  }
}
