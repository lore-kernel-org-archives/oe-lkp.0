Content-Type: multipart/mixed; boundary="===============6127225572343121108=="
MIME-Version: 1.0
From: Joerg Roedel <jroedel@suse.de>
To: lkp@lists.01.org
Subject: Re: 0604a4fd53 ("x86/mm: remove vmalloc faulting"): [ 80.661587] BUG: unable to handle page fault for address: fb40c000
Date: Thu, 28 May 2020 11:14:55 +0200
Message-ID: <20200528091454.GD6857@suse.de>
In-Reply-To: <20200528084208.GV12456@shao2-debian>
List-Id: <oe-lkp.lists.linux.dev>

--===============6127225572343121108==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2020 at 04:42:09PM +0800, kernel test robot wrote:
> [   80.686904] Code: 89 c8 c3 90 8d 74 26 00 85 c0 c7 01 01 00 00 00 75 d=
8 a1 6c 94 a8 08 eb d1 66 90 66 90 66 90 66 90 66 90 66 90 66 90 90 cd 80 <=
c3> 8d b6 00 00 00 00 8d bc 27 00 00 00 00 8b 10 a3 94 94 a8 08 85
> [   80.690396] EAX: ffffffda EBX: 00000132 ECX: a6f11000 EDX: 00000000
> [   80.691639] ESI: 00000024 EDI: 0000fffc EBP: 0000fff8 ESP: afef5ae8
> [   80.692918] DS: 007b ES: 007b FS: 0000 GS: 0033 SS: 007b EFLAGS: 00000=
292
> [   80.694316] Modules linked in:
> [   80.694962] CR2: 00000000fb40c000
> [   80.695729] ---[ end trace eda436684f987d33 ]---
> [   80.696742] EIP: __vmalloc_node_range+0x16d/0x470

Looking into it.
--===============6127225572343121108==--

