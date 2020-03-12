Content-Type: multipart/mixed; boundary="===============7945047175669375873=="
MIME-Version: 1.0
From: Linus Torvalds <torvalds@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [locks] 6d390e4b5d: will-it-scale.per_process_ops -96.6% regression
Date: Wed, 11 Mar 2020 17:38:14 -0700
Message-ID: <CAHk-=wiNoAk8v3GrbK3=q6KRBrhLrTafTmWmAo6-up6Ce9fp6A@mail.gmail.com>
In-Reply-To: <87v9nattul.fsf@notabene.neil.brown.name>
List-Id: <oe-lkp.lists.linux.dev>

--===============7945047175669375873==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2020 at 3:22 PM NeilBrown <neilb@suse.de> wrote:
>
> We can combine the two ideas - move the list_del_init() later, and still
> protect it with the wq locks.  This avoids holding the lock across the
> callback, but provides clear atomicity guarantees.

Ugfh. Honestly, this is disgusting.

Now you re-take the same lock in immediate succession for the
non-callback case.  It's just hidden.

And it's not like the list_del_init() _needs_ the lock (it's not
currently called with the lock held).

So that "hold the lock over list_del_init()" seems to be horrendously
bogus. It's only done as a serialization thing for that optimistic
case.

And that optimistic case doesn't even *want* that kind of
serialization. It really just wants a "I'm done" flag.

So no. Don't do this. It's mis-using the lock in several ways.

             Linus
--===============7945047175669375873==--

