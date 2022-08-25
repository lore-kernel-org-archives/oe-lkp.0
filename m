Content-Type: multipart/mixed; boundary="===============4545875959765251290=="
MIME-Version: 1.0
From: Shakeel Butt <shakeelb@google.com>
To: lkp@lists.01.org
Subject: Re: [PATCH v2 2/3] mm: page_counter: rearrange struct page_counter fields
Date: Thu, 25 Aug 2022 08:24:02 -0700
Message-ID: <CALvZod6tFce5Ld9rh-xt495S+A-vi4Curkja2YYyf0VizKw1tw@mail.gmail.com>
In-Reply-To: <20220824222150.61c516a83bfe0ecb6c9b5348@linux-foundation.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============4545875959765251290==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 24, 2022 at 10:21 PM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Wed, 24 Aug 2022 21:41:42 -0700 Shakeel Butt <shakeelb@google.com> w=
rote:
>
> > > Did you evaluate the effects of using a per-cpu counter of some form?
> >
> > Do you mean per-cpu counter for usage or something else?
>
> percpu_counter, perhaps.  Or some hand-rolled thing if that's more suitab=
le.
>
> > The usage
> > needs to be compared against the limits and accumulating per-cpu is
> > costly particularly on larger machines,
>
> Well, there are tricks one can play.  For example, only run
> __percpu_counter_sum() when `usage' is close to its limit.
>
> I'd suggest flinging together a prototype which simply uses
> percpu_counter_read() all the time.  If the performance testing results
> are sufficiently promising, then look into the accuracy issues.
>

Thanks, I will take a stab at that in a week or so.
--===============4545875959765251290==--

