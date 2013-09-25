Content-Type: multipart/mixed; boundary="===============7050157874449723637=="
MIME-Version: 1.0
From: Lin Ming <minggr@gmail.com>
To: lkp@lists.01.org
Subject: Re: increased vmap_area_lock contentions on "n_tty: Move buffers into n_tty_data"
Date: Wed, 25 Sep 2013 22:53:22 +0800
Message-ID: <CAF1ivSaAcZfwAmdUhH1SZeaRLokNBVA4ScxTWeifHVWXiX_e-Q@mail.gmail.com>
In-Reply-To: <5242C960.7050506@hurleysoftware.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============7050157874449723637==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 25, 2013 at 7:30 PM, Peter Hurley <peter@hurleysoftware.com> =
wrote:
> On 09/25/2013 05:04 AM, Lin Ming wrote:
>>
>> On Wed, Sep 18, 2013 at 8:22 AM, Peter Hurley <peter@hurleysoftware.co=
m>
>> wrote:
>> [snip]
>>>
>>>
>>> Looking over vmalloc.c, the critical section footprint of the
>>> vmap_area_lock
>>> could definitely be reduced (even nearly eliminated), but that's a
>>> project
>>> for
>>> another day :)
>>
>>
>> Hi Peter,
>>
>> I also looked over vmallo.c, but didn't find obvious way to reduce the
>> critical section footprint.
>> Could you share some hints how to do this?
>
>
> vmap_area_list is an RCU list.
> get_vmalloc_info() doesn't need to take the vmap_area_lock at all.
> Look at __purge_vmap_area_lazy() for a howto.

Looking at it now ...

Thanks,
Lin Ming

>
> Regards,
> Peter Hurley
>

--===============7050157874449723637==--

