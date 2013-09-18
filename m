Content-Type: multipart/mixed; boundary="===============2297643107643905305=="
MIME-Version: 1.0
From: Peter Hurley <peter@hurleysoftware.com>
To: lkp@lists.01.org
Subject: Re: increased vmap_area_lock contentions on "n_tty: Move buffers into n_tty_data"
Date: Tue, 17 Sep 2013 20:49:51 -0400
Message-ID: <5238F8AF.4050309@hurleysoftware.com>
In-Reply-To: <20130913010936.GA1291@localhost>
List-Id: <oe-lkp.lists.linux.dev>

--===============2297643107643905305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 09/12/2013 09:09 PM, Fengguang Wu wrote:
> On Fri, Sep 13, 2013 at 08:51:33AM +0800, Fengguang Wu wrote:
>> Hi Peter,
>>
>> FYI, we noticed much increased vmap_area_lock contentions since this
>> commit:
>>
>> commit 20bafb3d23d108bc0a896eb8b7c1501f4f649b77
>> Author: Peter Hurley <peter@hurleysoftware.com>
>> Date:   Sat Jun 15 10:21:19 2013 -0400
>>
>>      n_tty: Move buffers into n_tty_data
>>
>>      Reduce pointer reloading and improve locality-of-reference;
>>      allocate read_buf and echo_buf within struct n_tty_data.
>
> Here are some comparison between this commit [o] with its parent commit [=
*].

[...]

>      8cb06c983822103da1cf      20bafb3d23d108bc0a89
> ------------------------  ------------------------
>                    976.67      +108.3%      2034.67  lkp-a04/micro/netper=
f/120s-200%-TCP_STREAM
>                   8971.36       +11.4%      9997.05  nhm-white/micro/aim7=
/exec_test
>                   9948.03       +20.9%     12031.72  TOTAL slabinfo.kmall=
oc-128.active_objs
>
>      8cb06c983822103da1cf      20bafb3d23d108bc0a89
> ------------------------  ------------------------
>                    976.67      +108.3%      2034.67  lkp-a04/micro/netper=
f/120s-200%-TCP_STREAM
>                   9127.64       +11.4%     10164.15  nhm-white/micro/aim7=
/exec_test
>                  10104.31       +20.7%     12198.82  TOTAL slabinfo.kmall=
oc-128.num_objs

The dramatic increase in 128-byte kmalloc blocks is from vmalloc overhead
with associated with each allocation. On a x86_64, struct vmap_area is 104 =
bytes,
rounded to 128, allocated with every vmalloc allocation. This is approx 1% =
overhead
(which seems high to me).

The reason this is still visible after the test completes is the vmap area =
is
lazily reclaimed (see mm/vmalloc.c:__purge_vmap_area_lazy()).

1% memory overhead coupled with the unwanted vmap_area_lock contention (eve=
n though it is
test-induced) -- I might revert this anyway.

Regards,
Peter Hurley

--===============2297643107643905305==--

