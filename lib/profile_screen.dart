import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE2E8F0), // Background canvas
      body: Center(
        child: Container(
          width: 390,
          constraints: const BoxConstraints(maxHeight: 1163),
          decoration: BoxDecoration(
            color: const Color(0xFFF8FAFC),
            borderRadius: BorderRadius.circular(44), // border-radius: 44px
            border: Border.all(
              color: const Color(0xFFCBD5E1), // border-color: #CBD5E1
              width: 3, // border-width: 3px
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.08),
                blurRadius: 24,
                offset: const Offset(0, 12),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(41),
            child: SingleChildScrollView(
              // padding: top: 44px, right: 24px, bottom: 36px, left: 24px
              padding: const EdgeInsets.only(
                top: 44,
                right: 24,
                bottom: 36,
                left: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. TopBar (Back, Title, Share)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 20,
                        height: 42,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: const Icon(
                          Icons.chevron_left,
                          size: 22,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      const Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                      Container(
                        width: 20,
                        height: 42,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: const Color(0xFFE2E8F0)),
                        ),
                        child: const Icon(
                          Icons.share_outlined,
                          size: 20,
                          color: Color(0xFF0F172A),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24), // gap: 24px
                  // 2. Profile Header (Column: CrossAxisAlignment.center)
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Stack (Avatar: 140x140 | Multi-layer)
                        SizedBox(
                          width: 140,
                          height: 140,
                          child: Stack(
                            children: [
                              // Container (Gradient Ring: 140x140 | #FFB088 -> #FF8080 -> #FFCF71)
                              Container(
                                width: 140,
                                height: 140,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFFFFB088),
                                      Color(0xFFFF8080),
                                      Color(0xFFFFCF71),
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                              ),
                              // Container (White Border: 132x132 | top: 4px, left: 4px)
                              Positioned(
                                top: 4,
                                left: 4,
                                child: Container(
                                  width: 132,
                                  height: 132,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(0xFFFFFFFF),
                                  ),
                                ),
                              ),
                              // ClipOval > Image (Alex Rivers: 124x124 | top: 8px, left: 8px)
                              Positioned(
                                top: 8,
                                left: 8,
                                child: ClipOval(
                                  child: Image.asset(
                                    'images/1_1.jpg',
                                    width: 124,
                                    height: 124,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              // Positioned (Verified Badge: 28x28 | top: 104px, left: 104px | Blue #0284C7)
                              Positioned(
                                top: 104,
                                left: 104,
                                child: Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF0284C7),
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 12),
                        // Text ('Phuc Hau' | 24px w800 | #0F172A)
                        const Text(
                          'Phuc Hau',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF0F172A),
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(height: 6),
                        // Text ('Lead Mobile Engineer' | 15px w500 | #64748B)
                        const Text(
                          'Lead Mobile Engineer',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF64748B),
                            height: 1.0,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Container > Row (Location Pill: Radius 20 | #F1F5F9 | Border #E2E8F0)
                        Container(
                          height: 30,
                          padding: const EdgeInsets.only(
                            top: 6,
                            right: 14,
                            bottom: 6,
                            left: 14,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F5F9),
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFE2E8F0),
                              width: 1,
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Icon(
                                Icons.location_on_outlined,
                                size: 15,
                                color: Color(0xFF475569),
                              ),
                              SizedBox(width: 6), // gap: 6px
                              Text(
                                'TP.HCM, Viet Nam',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF475569),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24), // gap: 24px
                  // 3. Stats Card (Container > Row: Radius 20 | BoxShadow 0 8 18)
                  Container(
                    height: 78,
                    padding: const EdgeInsets.only(
                      top: 18,
                      right: 20,
                      bottom: 18,
                      left: 20,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFF1F5F9),
                        width: 1,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0D0F1729), // #0F17290D (rgba opacity)
                          blurRadius: 18,
                          offset: Offset(0, 8),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Column (148 Projects)
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                '148',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF0F172A),
                                  height: 1.0,
                                ),
                              ),
                              SizedBox(height: 4), // gap: 4px
                              Text(
                                'Projects',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF94A3B8),
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // VerticalDivider (1x28 | #E2E8F0)
                        Container(
                          height: 28,
                          width: 1,
                          color: const Color(0xFFE2E8F0),
                        ),
                        // Column (9 Yrs Experience)
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                '9 Yrs',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF0F172A),
                                  height: 1.0,
                                ),
                              ),
                              SizedBox(height: 4), // gap: 4px
                              Text(
                                'Experience',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF94A3B8),
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                        // VerticalDivider (1x28 | #E2E8F0)
                        Container(
                          height: 28,
                          width: 1,
                          color: const Color(0xFFE2E8F0),
                        ),
                        // Column (4.9 ★ Rating)
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    '4.9',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFFEAB308),
                                      height: 1.0,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(
                                    Icons.star_rounded,
                                    size: 18,
                                    color: Color(0xFFEAB308),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4), // gap: 4px
                              const Text(
                                'Rating',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF94A3B8),
                                  height: 1.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24), // gap: 24px
                  // 4. About Me (Column)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      // Heading ('About Me' | 17px Bold)
                      Text(
                        'About Me',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0F172A),
                          height: 1.0,
                        ),
                      ),
                      SizedBox(height: 8), // gap: 8px
                      // Body Paragraph (14px Regular | Line-height 21px)
                      Text(
                        'Passionate Lead Mobile Engineer specialized in Flutter, Dart, and building high-performance cross-platform applications. Focused on elegant architecture, intuitive UX, and design systems.',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 1.5, // 21px / 14px = 1.5
                          color: Color(0xFF475569),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24), // gap: 24px giữa các section
                  // 5. Skills & Expertise (Column > Wrap)
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Heading ('Skills & Expertise' | 17px Bold)
                      const Text(
                        'Skills & Expertise',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0F172A),
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(height: 10), // gap: 10px
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _buildColoredSkillChip(
                            label: 'Flutter',
                            icon: Icons.flutter_dash,
                            bgColor: const Color(0xFFE0F2FE),
                            textColor: const Color(0xFF0284C7),
                          ),
                          _buildColoredSkillChip(
                            label: 'Dart',
                            icon: Icons.code_rounded,
                            bgColor: const Color(0xFFDCFCE7),
                            textColor: const Color(0xFF15803D),
                          ),
                          _buildColoredSkillChip(
                            label: 'Clean Arch',
                            icon: Icons.layers_outlined,
                            bgColor: const Color(0xFFFFE4E6),
                            textColor: const Color(0xFFBE123C),
                          ),
                          _buildColoredSkillChip(
                            label: 'UI/UX',
                            icon: Icons.edit_outlined,
                            bgColor: const Color(0xFFF3E8FF),
                            textColor: const Color(0xFF7E22CE),
                          ),
                          _buildColoredSkillChip(
                            label: 'Firebase',
                            icon: Icons.local_fire_department_rounded,
                            bgColor: const Color(0xFFFEF3C7),
                            textColor: const Color(0xFFB45309),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24), // gap: 24px
                  // 6. Featured Projects
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Heading ('Featured Projects' | 17px Bold)
                      const Text(
                        'Featured Projects',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF0F172A),
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(height: 12), // gap: 12px
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: _buildProjectCard(
                              title: 'E-Shop Flutter',
                              subtitle: 'Mobile App • 2026',
                              imagePath: 'images/1_1.jpg',
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildProjectCard(
                              title: 'Crypto Vault',
                              subtitle: 'Finance • Clean Arch',
                              imagePath: 'images/1_2.jpg',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24), // gap: 24px

                  // 7. Contact Information Card (Radius 20 | Shadow 0 4 12)
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFFFF),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: const Color(0xFFE2E8F0),
                        width: 1,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0x0A0F1729), // #0F17290A
                          blurRadius: 12,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _buildContactRow(
                          icon: Icons.alternate_email_rounded,
                          title: 'Contact Information',
                          isHeader: true,
                        ),
                        const Divider(height: 1, color: Color(0xFFF1F5F9)),
                        _buildContactRow(
                          icon: Icons.mail_outline_rounded,
                          title: 'alex.rivers@email.com',
                        ),
                        const Divider(height: 1, color: Color(0xFFF1F5F9)),
                        _buildContactRow(
                          icon: Icons.phone_outlined,
                          title: '+81 (90) 1234-5678',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Colored Skill Chip Builder
  Widget _buildColoredSkillChip({
    required String label,
    required IconData icon,
    required Color bgColor,
    required Color textColor,
  }) {
    return Container(
      height: 32,
      padding: const EdgeInsets.only(
        top: 8,
        right: 14,
        bottom: 8,
        left: 14,
      ),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(14), // border-radius: 14px
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: textColor),
          const SizedBox(width: 6), // gap: 6px
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: textColor,
              height: 1.0,
            ),
          ),
        ],
      ),
    );
  }

  // Project Card Builder (Card 165x145 | Radius 16)
  Widget _buildProjectCard({
    required String title,
    required String subtitle,
    String? imagePath,
    Gradient? gradient,
  }) {
    return Container(
      height: 145,
      decoration: BoxDecoration(
        color: const Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A0F1729), // #0F17290A
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.network / Image.asset (165x85)
            Container(
              height: 85,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: gradient,
                image: imagePath != null
                    ? DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
            // Padding Content (10px padding)
            Padding(
              padding: const EdgeInsets.only(
                top: 8,
                right: 10,
                bottom: 10,
                left: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF0F172A),
                      height: 1.0,
                    ),
                  ),
                  const SizedBox(height: 2), // gap: 2px
                  Text(
                    subtitle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF64748B),
                      height: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Contact Row Builder (Padding 14/16/14/16 | Icon Box 34x34 Radius 10)
  Widget _buildContactRow({
    required IconData icon,
    required String title,
    bool isHeader = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 14,
        right: 16,
        bottom: 14,
        left: 16,
      ),
      child: Row(
        children: [
          // Icon Box (34x34 | Radius 10 | Bg #F1F5F9)
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: const Color(0xFFF1F5F9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(
              icon,
              size: 18,
              color: isHeader ? const Color(0xFF0F172A) : const Color(0xFF64748B),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 14,
                fontWeight: isHeader ? FontWeight.w700 : FontWeight.w500,
                color: isHeader
                    ? const Color(0xFF0F172A)
                    : const Color(0xFF334155),
                height: 1.0,
              ),
            ),
          ),
          const Icon(
            Icons.chevron_right,
            size: 18,
            color: Color(0xFFCBD5E1),
          ),
        ],
      ),
    );
  }
}
