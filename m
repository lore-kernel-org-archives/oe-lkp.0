Content-Type: multipart/mixed; boundary="===============5017235911082433842=="
MIME-Version: 1.0
From: Matthew Wilcox <mawilcox@microsoft.com>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] e5a305ac4a: WARNING:at_lib/list_debug.c:#__list_del_entry_valid
Date: Wed, 18 Jan 2017 05:13:23 +0000
Message-ID: <BY2PR21MB003657B5CEF213783D091C8CCB7F0@BY2PR21MB0036.namprd21.prod.outlook.com>
In-Reply-To: <20170118012304.GB14484@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5017235911082433842==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: lkp-robot-request(a)eclists.intel.com [mailto:lkp-robot-request(a)ecl=
ists.intel.com] On Behalf Of kernel test robot
> FYI, we noticed the following commit:
> =

> commit: e5a305ac4a5233e039586c97f4ea643a4c7dc484 ("Reimplement IDR
> and IDA using the radix tree")
> https://na01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fgit.ke=
rnel
> .org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-
> next.git&data=3D02%7C01%7Cmawilcox%40microsoft.com%7C3b615320ff5c48f
> efde708d43f40a5f9%7C72f988bf86f141af91ab2d7cd011db47%7C1%7C0%7C6
> 36202994282292096&sdata=3DvMGk%2FAoZeMkABynnuEIiKM07li%2FzdZlSMM
> NmwNIGQ1s%3D&reserved=3D0 master

1. I'm not entirely convinced that this is a reasonable commit to test.  Du=
e to the way Andrew has merged a fix for this commit in a second commit, it=
's expected to be buggy.  Although I don't think it could cause this specif=
ic failure pattern.  Testing commit ffc87d11841ec68a44c57735ff4fada521ab5a2=
7 would make more sense.

2. Ignoring the mangling that outlook has done to that URL, it's pointing s=
omewhere not very useful for a web browser to access: http://git.kernel.org=
/pub/scm/linux/kernel/git/next/linux-next.git/

Pointing to https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.gi=
t/ would make more sense

3. Thank you for reminding me that I need to send Andrew a complete replace=
ment for that patch.


--===============5017235911082433842==--

