Content-Type: multipart/mixed; boundary="===============5943352333392213945=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [iversion] c0cef30e4f: aim7.jobs-per-min -18.0% regression
Date: Sun, 25 Feb 2018 13:18:38 -0800
Message-ID: <CA+55aFzRAn=7km3xNn2BKjsLAc=SOma584tYnzD+nanab8H_Hw@mail.gmail.com>
In-Reply-To: <20180225150505.GD7144@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============5943352333392213945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 25, 2018 at 7:05 AM, kernel test robot
<xiaolong.ye@intel.com> wrote:
>
> FYI, we noticed a -18.0% regression of aim7.jobs-per-min due to commit:
>
> commit: c0cef30e4ff0dc025f4a1660b8f0ba43ed58426e ("iversion: make inode_c=
mp_iversion{+raw} return bool instead of s64")

That looks very unlikely.  Can you double-check that? Because it
shouldn't even change anything apart from trivial compiler instruction
selection.

             Linus

--===============5943352333392213945==--

