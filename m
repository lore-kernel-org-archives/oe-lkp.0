Content-Type: multipart/mixed; boundary="===============2755977974801694728=="
MIME-Version: 1.0
From: Andrew Morton <akpm@linux-foundation.org>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 2/3] mm: page_counter: rearrange struct page_counter fields
Date: Wed, 24 Aug 2022 22:21:50 -0700
Message-ID: <20220824222150.61c516a83bfe0ecb6c9b5348@linux-foundation.org>
In-Reply-To: <CALvZod6+Y1yvp8evMLTeEwKnQyoXJmzjO7xLN9w=EPcOUH6BHQ@mail.gmail.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============2755977974801694728==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, 24 Aug 2022 21:41:42 -0700 Shakeel Butt <shakeelb@google.com> wro=
te:

> > Did you evaluate the effects of using a per-cpu counter of some form?
> =

> Do you mean per-cpu counter for usage or something else?

percpu_counter, perhaps.  Or some hand-rolled thing if that's more suitable.

> The usage
> needs to be compared against the limits and accumulating per-cpu is
> costly particularly on larger machines,

Well, there are tricks one can play.  For example, only run
__percpu_counter_sum() when `usage' is close to its limit.  =


I'd suggest flinging together a prototype which simply uses
percpu_counter_read() all the time.  If the performance testing results
are sufficiently promising, then look into the accuracy issues.

--===============2755977974801694728==--

