Content-Type: multipart/mixed; boundary="===============7324582358254456423=="
MIME-Version: 1.0
From: Dave Jones <davej@codemonkey.org.uk>
To: lkp@lists.01.org
Subject: Re: More information please. Re: [fs] 54cc07a761: BUG: kernel test crashed
Date: Tue, 26 Jul 2016 17:15:16 -0400
Message-ID: <20160726211516.GA9577@codemonkey.org.uk>
In-Reply-To: <20160726151344.GB8811@wfg-t540p.sh.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7324582358254456423==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 26, 2016 at 11:13:44PM +0800, Fengguang Wu wrote:
 =

 > >> The "BUG: kernel test crashed" means the VM reboots by itself while
 > >> the trinity test is running. If the error message is "BUG: kernel boot
 > >> crashed" it'd mean VM abnormally reboots before any test is launched.
 > >
 > >Is it possible to include a url pointing to a page of documentation
 > >holding this information in your emails or alternatively a url pointing
 > >to some source code.  Just so other people don't have to ask you this
 > >question.
 > =

 > Yes that's the right directions to follow. We'll make the reports more
 > understandable and the test/bisects more reliable.
 > =

 > In particular, I suspect this false report might be related to QEMU
 > watchdog. The wild guess is, if trinity touches the watchdog device by
 > accident, it may result in the VM reset w/o any symptom.
 =

See ignore_files() in pathnames.c
Adding an entry to the blacklist there is easy enough to prove/disprove thi=
s.

	Dave


--===============7324582358254456423==--

