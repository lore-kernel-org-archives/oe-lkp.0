Content-Type: multipart/mixed; boundary="===============3077646105807560125=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [x86/asm/entry] BUG: unable to handle kernel paging request
Date: Mon, 09 Mar 2015 10:12:46 -0700
Message-ID: <CA+55aFxHfqS=GJLtcmd9NsP9qpquzd8Ow+AtOi+-hfxD=O-NDg@mail.gmail.com>
In-Reply-To: <20150309165513.GA9212@pd.tnic>
List-Id: <oe-lkp.lists.linux.dev>

--===============3077646105807560125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 9, 2015 at 9:55 AM, Borislav Petkov <bp@alien8.de> wrote:
> On Mon, Mar 09, 2015 at 09:49:42AM -0700, Linus Torvalds wrote:
>>
>> I don't remember when it was open-coded, and I never created a git
>> archive of all the old tar-files from before BK, so it's not trivial
>> to check ;(
>
> This maybe:
>
> http://git.kernel.org/cgit/linux/kernel/git/history/history.git/

Ahh.  Yes. Not a very good import (dates are generally crap etc), but
better than nothing.

It's still an ljmp to the TSS in 2.0.

Looks like it got open coded in  v2.1.109pre1 according to that.

Around July -98 or something similar.

                             Linus

--===============3077646105807560125==--

