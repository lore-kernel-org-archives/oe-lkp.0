Content-Type: multipart/mixed; boundary="===============4028506730601447271=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [xfs] 68a9f5e700: aim7.jobs-per-min -13.6% regression
Date: Thu, 11 Aug 2016 09:55:33 -0700
Message-ID: <CA+55aFyVqdk0p6pmEx_gOs_AiH0TJ23ZEUDZHc9kiFbqEk8UOw@mail.gmail.com>
In-Reply-To: <20160811155721.GA23015@lst.de>
List-Id: <oe-lkp.lists.linux.dev>

--===============4028506730601447271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 8:57 AM, Christoph Hellwig <hch@lst.de> wrote:
>
> The one liner below (not tested yet) to simply remove it should fix that
> up.  I also noticed we have a spurious pagefault_disable/enable, I
> need to dig into the history of that first, though.

Hopefully the pagefault_disable/enable doesn't matter for this case.

Can we get this one-liner tested with the kernel robot for comparison?
I really think a messed-up LRU list could cause bad IO patterns, and
end up keeping dirty pages around that should be streaming out to disk
and re-used, so causing memory pressure etc for no good reason.

I think the mapping->tree_lock issue that Dave sees is interesting
too, but the kswapd activity (and the extra locking it causes) could
also be a symptom of the same thing - memory pressure due to just
putting pages in the active file that simply shouldn't be there.

So the trivial oneliner _might_ just explain things. It would be
really nice if the regression turns out to be due to something so
easily fixed.

                Linus

--===============4028506730601447271==--

