Content-Type: multipart/mixed; boundary="===============6830838037635205232=="
MIME-Version: 1.0
From: Andi Kleen <ak@linux.intel.com>
To: lkp@lists.01.org
Subject: Re: [x86/topology] 05aa90edc7: kernel_BUG_at_arch/x86/kernel/cpu/common.c
Date: Thu, 14 Sep 2017 10:34:07 -0700
Message-ID: <20170914173407.GG24844@tassilo.jf.intel.com>
In-Reply-To: <79fb7f24-caac-2da6-92bf-dfffaa905ee3@redhat.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============6830838037635205232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

> Everytime a socket is down'd and up'd the logical_packages value increase=
s by
> one, and eventually overflows.
> =

> Andi -- I can add this to your patch if you're okay with it.

Sure looks good (minus all the pr_debugs). Thanks for debugging.

-Andi

--===============6830838037635205232==--

