Content-Type: multipart/mixed; boundary="===============3996083691332431306=="
MIME-Version: 1.0
From: Florian Westphal <fw@strlen.de>
To: lkp@lists.01.org
Subject: Re: [netfilter] a0aa657b74: WARNING:at_kernel/locking/lockdep.c:#lockdep_init_map_type
Date: Fri, 04 Jun 2021 07:46:15 +0200
Message-ID: <20210604054615.GA32304@breakpoint.cc>
In-Reply-To: <20210604030057.GA2227@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============3996083691332431306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

kernel test robot <oliver.sang@intel.com> wrote:
> [   83.355329] ------------[ cut here ]------------
> [   83.359909] DEBUG_LOCKS_WARN_ON(!name)
> [   83.359913] WARNING: CPU: 0 PID: 4931 at kernel/locking/lockdep.c:4665=
 lockdep_init_map_type (kbuild/src/consumer/kernel/locking/lockdep.c:4665 (=
discriminator 9)) =

> [   83.373072] Modules linked in: nfnetlink(+) btrfs blake2b_generic xor =
zstd_compress raid6_pq libcrc32c sd_mod intel_rapl_msr intel_rapl_common t1=
0_pi sg x86_pkg_temp_thermal intel_powerclamp coretemp crct10dif_pclmul crc=
32_pclmul crc32c_intel ghash_clmulni_intel i915 ipmi_devintf ipmi_msghandle=
r mei_wdt wmi_bmof ahci libahci rapl intel_cstate i2c_i801 intel_uncore lib=
ata i2c_smbus intel_pch_thermal mei_me mei wmi intel_gtt video intel_pmc_co=
re acpi_pad ip_tables
> [   83.413628] CPU: 0 PID: 4931 Comm: modprobe Not tainted 5.13.0-rc3-007=
37-ga0aa657b7490 #1
> [   83.421755] Hardware name: Dell Inc. OptiPlex 7040/0Y7WYT, BIOS 1.8.1 =
12/05/2017

The patch misses an update in nfnetlink subsystem, will send a v2.
--===============3996083691332431306==--

