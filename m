Content-Type: multipart/mixed; boundary="===============0379018373743399995=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Mon, 24 Feb 2020 13:43:02 -0800
Message-ID: <CAHk-=wh0z0LErNzwe-AqrEkv3BNzJep58Qmi2dM775UPtmq0og@mail.gmail.com>
In-Reply-To: <87a757znqd.fsf@x220.int.ebiederm.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============0379018373743399995==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 1:22 PM Eric W. Biederman <ebiederm@xmission.com>=
 wrote:
>
> I keep looking at your patch and wondering if there isn't a way
> to remove the uid refcount entirely on this path.

I agree. I tried to come up with something, but couldn't.

> Linus I might be wrong but I have this sense that your change will only
> help when signal delivery is backed up.  I expect in the common case
> there won't be any pending signals outstanding for the user.

Again, 100% agreed.

HOWEVER.

The normal case where there's one only signal pending is also the case
where we don't care about the extra atomic RMW access. By definition
that's not going to ever going to show up as a performance issue or
for cacheline contention.

So the only case that matters from a performance standpoint is the
"lots of signals" case, in which case you'll see that sigqueue become
backed up.

But as I said in the original thread (before you got added to the list):

 "I don't know. This does not seem to be a particularly serious load."

I'm not convinced this will show up outside of this kind of
signal-sending microbenchmark.

That said, I don't really see any downside to the patch either, so...

                Linus
--===============0379018373743399995==--

