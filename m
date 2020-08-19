Content-Type: multipart/mixed; boundary="===============8652287180585861462=="
MIME-Version: 1.0
From: Luck, Tony <tony.luck@intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/mce] 1de08dccd3: will-it-scale.per_process_ops -14.1% regression
Date: Wed, 19 Aug 2020 02:23:11 +0000
Message-ID: <149e0cfb5b7e48dfb9bea966c7741336@intel.com>
In-Reply-To: <20200819020437.GA2605@shbuild999.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============8652287180585861462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

	0000000000019260 D pqr_state

Do you have /sys/fs/resctrl mounted?  This variable is read on every contex=
t switch.
If your benchmark does a lot of context switching and this now shares a cac=
he line
with something different (especially something that is sometimes modified f=
rom another
CPU) that could cause some cache line bouncing.

-Tony
--===============8652287180585861462==--

