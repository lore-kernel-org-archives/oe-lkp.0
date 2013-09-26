Content-Type: multipart/mixed; boundary="===============3937851257418758275=="
MIME-Version: 1.0
From: Peter Hurley <peter@hurleysoftware.com>
To: lkp@lists.01.org
Subject: Re: increased vmap_area_lock contentions on "n_tty: Move buffers into n_tty_data"
Date: Thu, 26 Sep 2013 13:22:08 -0400
Message-ID: <52446D40.9040504@hurleysoftware.com>
In-Reply-To: <20130926153208.GN18242@two.firstfloor.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============3937851257418758275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/26/2013 11:32 AM, Andi Kleen wrote:
> On Thu, Sep 26, 2013 at 07:52:23AM -0400, Peter Hurley wrote:
>> On 09/25/2013 11:20 PM, Andi Kleen wrote:
>>> Lin Ming <minggr@gmail.com> writes:
>>>>
>>>> Would you like below patch?
>>>
>>> The loop body keeps rather complex state. It could easily
>>> get confused by parallel RCU changes.
>>>
>>> So if the list changes in parallel you may suddenly
>>> report very bogus values, as the va_start - prev_end
>>> computation may be bogus.
>>>
>>> Perhaps it's ok (may report bogus gaps), but it seems a bit risky.
>>
>> I don't understand how the computed gap would be bogus; there
>> _was_ a list state in which that particular gap existed. The fact
>
> It could change any time as you don't have an atomic view
> of vm_end / vm_start. It is valid to change the fields
> with the lock held.

va_start and va_end are constant for the lifetime of their vmap_area
(if it's accessible by traversing the vmap_area_list), so it is
not possible for an rcu-based list traversal to see different
values of these individual fields than the spin-locked version.

In addition, for the rcu-based traversal to have arrived at any given
vmap_area requires that the previous vmap_area was its adjacent
lower range at the instant in time when the list cursor was advanced;
again, this is no different than if the spin-locked version had
happened to begin at that same instant.

Regards,
Peter Hurley




--===============3937851257418758275==--

