Content-Type: multipart/mixed; boundary="===============2745028440505590193=="
MIME-Version: 1.0
From: Kalle Valo <kvalo@qca.qualcomm.com>
To: lkp@lists.01.org
Subject: Re: ae4adb2c6b ("Merge 'ath6kl/master' into .."): BUG: kernel hang in boot stage
Date: Tue, 14 Nov 2017 07:11:13 +0000
Message-ID: <87o9o5ibl7.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <5a0975ac.+rH2lWxxNFMUvUR0%fengguang.wu@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2745028440505590193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Fengguang,

kernel test robot <fengguang.wu@intel.com> writes:

> 0day kernel testing robot got the below dmesg and the first bad commit is
>
> git://internal_merge_and_test_tree devel-catchup-201711130242
>
> commit ae4adb2c6bda4351ba5d054b8c3020c1e7a1cb16
> Merge: 2a231f9390802 fafcab9d72554
> Author:     0day robot <fengguang.wu@intel.com>
> AuthorDate: Mon Nov 13 02:46:46 2017 +0800
> Commit:     0day robot <fengguang.wu@intel.com>
> CommitDate: Mon Nov 13 02:46:46 2017 +0800
>
>     Merge 'ath6kl/master' into devel-catchup-201711130242
>
> 2a231f9390  Merge 'driver-core/driver-core-testing' into devel-catchup-20=
1711130242
> fafcab9d72  Add localversion-wireless-testing-ath
> ae4adb2c6b  Merge 'ath6kl/master' into devel-catchup-201711130242
> 7b9e87d2f4  0day head guard for 'devel-catchup-201711130242'
> +-------------------------------------------------+------------+---------=
---+------------+------------+
> |                                                 | 2a231f9390 |
> | fafcab9d72 | ae4adb2c6b | 7b9e87d2f4 |
> +-------------------------------------------------+------------+---------=
---+------------+------------+
> | boot_successes | 52 | 51 | 0 | 0 |
> | boot_failures | 0 | 0 | 16 | 13 |
> | BUG:kernel_hang_in_boot_stage | 0 | 0 | 10 | 11 |
> | BUG:kernel_reboot-without-warning_in_boot_stage | 0 | 0 | 6 | 2 |
> +-------------------------------------------------+------------+---------=
---+------------+------------+
>
>
> Decompressing Linux... Parsing ELF... Performing relocations... done.
> Booting the kernel.

I don't understand this mail. Can I just ignore it?

-- =

Kalle Valo
--===============2745028440505590193==--

