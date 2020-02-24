Content-Type: multipart/mixed; boundary="===============1565425996457528264=="
MIME-Version: 1.0
From: Eric W. Biederman <ebiederm@xmission.com>
To: lkp@lists.01.org
Subject: Re: [perf/x86] 81ec3f3c4c: will-it-scale.per_process_ops -5.5% regression
Date: Mon, 24 Feb 2020 15:59:49 -0600
Message-ID: <8736azzlwq.fsf@x220.int.ebiederm.org>
In-Reply-To: <CAHk-=wh0z0LErNzwe-AqrEkv3BNzJep58Qmi2dM775UPtmq0og@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1565425996457528264==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Linus Torvalds <torvalds@linux-foundation.org> writes:

> On Mon, Feb 24, 2020 at 1:22 PM Eric W. Biederman <ebiederm@xmission.co=
m> wrote:
>>
>> I keep looking at your patch and wondering if there isn't a way
>> to remove the uid refcount entirely on this path.
>
> I agree. I tried to come up with something, but couldn't.
>
>> Linus I might be wrong but I have this sense that your change will only
>> help when signal delivery is backed up.  I expect in the common case
>> there won't be any pending signals outstanding for the user.
>
> Again, 100% agreed.
>
> HOWEVER.
>
> The normal case where there's one only signal pending is also the case
> where we don't care about the extra atomic RMW access. By definition
> that's not going to ever going to show up as a performance issue or
> for cacheline contention.
>
> So the only case that matters from a performance standpoint is the
> "lots of signals" case, in which case you'll see that sigqueue become
> backed up.
>
> But as I said in the original thread (before you got added to the list):
>
>  "I don't know. This does not seem to be a particularly serious load."
>
> I'm not convinced this will show up outside of this kind of
> signal-sending microbenchmark.
>
> That said, I don't really see any downside to the patch either, so...

Other than scratching my head about why are we optimizing neither do I.

It would help to have a comment somewhere in the code or the commit
message that says the issue is contetion under load.  So the next time
someone goes through the code and goes why aren't we doing the stupid
and simple thing it will be clear.

Eric
--===============1565425996457528264==--

