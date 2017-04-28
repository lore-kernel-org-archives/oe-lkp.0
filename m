Content-Type: multipart/mixed; boundary="===============6701577133797061795=="
MIME-Version: 1.0
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: lkp@lists.01.org
Subject: Re: [lkp-robot] [perf] 924726b2b5: double_fault:#[##]
Date: Fri, 28 Apr 2017 09:50:43 +0200
Message-ID: <20170428075043.7xas4vmsi34bbqrp@linutronix.de>
In-Reply-To: <20170428024426.GK31795@yexl-desktop>
List-Id: <oe-lkp.lists.linux.dev>

--===============6701577133797061795==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2017-04-28 10:44:26 [+0800], Ye Xiaolong wrote:
> I can't reproduce it either after I rebuilt kernel for commit 14aff62ede3=
9 for
> 6 times test.

Okay. So we are done here.

> Yes, as 0day built a large number of kernel everyday, we won't upload ker=
nel
> images and modules to github, it depends user to generate and append it to
> initrd.

Now I am getting mixed signals. So one should append the modules to the
initrd? In that case I keep it for further reference. But since you
can't trigger the original bug either=E2=80=A6

> Thanks,
> Xiaolong
Sebastian

--===============6701577133797061795==--

