Content-Type: multipart/mixed; boundary="===============6170374644836844812=="
MIME-Version: 1.0
From: Dave Jones <davej@codemonkey.org.uk>
To: lkp@lists.01.org
Subject: Re: More information please. Re: [fs] 54cc07a761: BUG: kernel test crashed
Date: Tue, 26 Jul 2016 17:18:59 -0400
Message-ID: <20160726211859.GB9577@codemonkey.org.uk>
In-Reply-To: <87wpk8p49p.fsf@x220.int.ebiederm.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============6170374644836844812==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2016 at 02:50:58PM -0500, Eric W. Biederman wrote:

 > > Yes that's the right directions to follow. We'll make the reports more
 > > understandable and the test/bisects more reliable.
 > =

 > Thanks.  Does trinity have a random seed it can export/import to rerun
 > the same tests?  I ask because there was a failure these tests caught
 > that if the right kernel options was enabled was 100% reliable and it
 > blamed a commit 10 patches down from the indicated commit.

It does log the random seed on startup, and can replay it with the -s option

There is some variance if you were to do two runs with the same seed back
to back, because on startup, it walks /proc & /sys, and they'd see differen=
t things
so for eg "read() from fd 100" might mean something entirely different.

But as the testbot runs a pretty minimal userspace, only runs trinity once,
and really early in boot, this point might not matter.

	Dave

--===============6170374644836844812==--

