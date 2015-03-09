Content-Type: multipart/mixed; boundary="===============1945418650406934336=="
MIME-Version: 1.0
From: Dave Jones <davej@codemonkey.org.uk>
To: lkp@lists.01.org
Subject: Re: [x86/asm/entry] BUG: unable to handle kernel paging request
Date: Mon, 09 Mar 2015 13:55:02 -0400
Message-ID: <20150309175502.GA27857@codemonkey.org.uk>
In-Reply-To: <CA+55aFxHfqS=GJLtcmd9NsP9qpquzd8Ow+AtOi+-hfxD=O-NDg@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1945418650406934336==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 09, 2015 at 10:12:46AM -0700, Linus Torvalds wrote:
 > On Mon, Mar 9, 2015 at 9:55 AM, Borislav Petkov <bp@alien8.de> wrote:
 > > On Mon, Mar 09, 2015 at 09:49:42AM -0700, Linus Torvalds wrote:
 > >>
 > >> I don't remember when it was open-coded, and I never created a git
 > >> archive of all the old tar-files from before BK, so it's not trivial
 > >> to check ;(
 > >
 > > This maybe:
 > >
 > > http://git.kernel.org/cgit/linux/kernel/git/history/history.git/
 > =

 > Ahh.  Yes. Not a very good import (dates are generally crap etc), but
 > better than nothing.

If anyone wants to do something better, the scripts I used to create
this tree are at https://github.com/kernelslacker/linux-historic-scripts
They are pretty ugly, due to the number of special cases over time.
I never gave a lot of thought about dates at the time.

Some of the older diffs/tarballs might not be on kernel.org any more, but I=
 probably
still have them if google can't find old mirrors.

	Dave


--===============1945418650406934336==--

