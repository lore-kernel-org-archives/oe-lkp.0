Content-Type: multipart/mixed; boundary="===============8209636163681512331=="
MIME-Version: 1.0
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: lkp@lists.01.org
Subject: Re: [mm/debug] f8bf55f05f: BUG:non-zero_pgtables_bytes_on_freeing_mm
Date: Sun, 29 Mar 2020 20:07:38 +0530
Message-ID: <fb14237e-f973-bc34-4981-280ba5e1eb92@arm.com>
In-Reply-To: <20200328130737.GA11705@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============8209636163681512331==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


On 03/28/2020 06:37 PM, kernel test robot wrote:
> [    9.304270] debug_vm_pgtable: debug_vm_pgtable: Validating architectur=
e page table helpers
> [    9.306147] random: get_random_u32 called from debug_vm_pgtable+0x2c/0=
x6a5 with crng_init=3D1
> [    9.306206] BUG: non-zero pgtables_bytes on freeing mm: -4096

This problem is on i386 platform via CONFIG_EXPERT with CONFIG_X86_PAE
still enabled. This particular configuration is not supported (even if
it could be tested via CONFIG_EXPERT) with ARCH_HAS_DEBUG_VM_PGTABLE.

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index beea77046f9b..df8a19e52e82 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -61,6 +61,7 @@  config X86
 	select ARCH_CLOCKSOURCE_INIT
 	select ARCH_HAS_ACPI_TABLE_UPGRADE	if ACPI
 	select ARCH_HAS_DEBUG_VIRTUAL
+	select ARCH_HAS_DEBUG_VM_PGTABLE	if !X86_PAE
 	select ARCH_HAS_DEVMEM_IS_ALLOWED
 	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_HAS_FAST_MULTIPLIER
--===============8209636163681512331==--

