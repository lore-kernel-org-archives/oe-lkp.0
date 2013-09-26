Content-Type: multipart/mixed; boundary="===============7785337746746120901=="
MIME-Version: 1.0
From: Peter Hurley <peter@hurleysoftware.com>
To: lkp@lists.01.org
Subject: Re: increased vmap_area_lock contentions on "n_tty: Move buffers into n_tty_data"
Date: Thu, 26 Sep 2013 07:52:23 -0400
Message-ID: <52441FF7.1030405@hurleysoftware.com>
In-Reply-To: <87r4cc8e0q.fsf@tassilo.jf.intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7785337746746120901==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/25/2013 11:20 PM, Andi Kleen wrote:
> Lin Ming <minggr@gmail.com> writes:
>>
>> Would you like below patch?
>
> The loop body keeps rather complex state. It could easily
> get confused by parallel RCU changes.
>
> So if the list changes in parallel you may suddenly
> report very bogus values, as the va_start - prev_end
> computation may be bogus.
>
> Perhaps it's ok (may report bogus gaps), but it seems a bit risky.

I don't understand how the computed gap would be bogus; there
_was_ a list state in which that particular gap existed. The fact
that it may not exist anymore can also happen in the existing
algorithm the instant get_vmalloc_info() drops the vmap_area_lock.

OTOH, parallel list changes could cause an rcu-based get_vmalloc_info()
to over-report or under-report used memory due to parallel list
changes.

If this is a problem in practice, then usage and largest chunk
should be tracked by the allocator instead, obviating the need for
get_vmalloc_info() to traverse the vmap_area_list at all.

Regards,
Peter Hurley

--===============7785337746746120901==--

