Content-Type: multipart/mixed; boundary="===============2055609106902215648=="
MIME-Version: 1.0
From: Borislav Petkov <bp@suse.de>
To: lkp@lists.01.org
Subject: Re: [x86/mm/64] f154f29085: BUG:kernel_reboot-without-warning_in_boot_stage
Date: Wed, 15 Dec 2021 11:05:30 +0100
Message-ID: <Ybm96seTxl+pWjTX@zn.tnic>
In-Reply-To: <20211215070012.GA26582@linux.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2055609106902215648==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 15, 2021 at 03:00:13PM +0800, Carel Si wrote:
> We have verified by hand, still can reproduce this issue.

Ok, please give details how exactly you reproduce: host, guest, kernel
versions, configs, machine types, i.e., /proc/cpuinfo, dmesg, etc. I'd
like to see if I can find a similar machine here.

Also, would it be possible to upload your vmlinuz somewhere so that I
can download it for testing?

Thx.

-- =

Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Ivo Totev, HRB 36809, AG N=C3=BCr=
nberg
--===============2055609106902215648==--

