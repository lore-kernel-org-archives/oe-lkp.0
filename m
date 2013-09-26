Content-Type: multipart/mixed; boundary="===============4211093577963795186=="
MIME-Version: 1.0
From: Andi Kleen <andi@firstfloor.org>
To: lkp@lists.01.org
Subject: Re: increased vmap_area_lock contentions on "n_tty: Move buffers into n_tty_data"
Date: Thu, 26 Sep 2013 17:32:08 +0200
Message-ID: <20130926153208.GN18242@two.firstfloor.org>
In-Reply-To: <52441FF7.1030405@hurleysoftware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============4211093577963795186==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2013 at 07:52:23AM -0400, Peter Hurley wrote:
> On 09/25/2013 11:20 PM, Andi Kleen wrote:
> >Lin Ming <minggr@gmail.com> writes:
> >>
> >>Would you like below patch?
> >
> >The loop body keeps rather complex state. It could easily
> >get confused by parallel RCU changes.
> >
> >So if the list changes in parallel you may suddenly
> >report very bogus values, as the va_start - prev_end
> >computation may be bogus.
> >
> >Perhaps it's ok (may report bogus gaps), but it seems a bit risky.
> =

> I don't understand how the computed gap would be bogus; there
> _was_ a list state in which that particular gap existed. The fact

It could change any time as you don't have an atomic view
of vm_end / vm_start. It is valid to change the fields
with the lock held.

-Andi

--===============4211093577963795186==--

