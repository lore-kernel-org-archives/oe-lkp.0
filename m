Content-Type: multipart/mixed; boundary="===============5508353806307322110=="
MIME-Version: 1.0
From: Yu Kuai <yukuai1@huaweicloud.com>
To: lkp@lists.01.org
Subject: Re: [blk] 8c5035dfbb: fio.read_iops -10.6% regression
Date: Sun, 09 Oct 2022 17:32:34 +0800
Message-ID: <e81ea0fe-dcd2-1e5d-9b78-3c79751b3097@huaweicloud.com>
In-Reply-To: <Y0KJmODYOh83OtGa@T590>
List-Id: <oe-lkp.lists.linux.dev>

--===============5508353806307322110==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi,

=E5=9C=A8 2022/10/09 16:43, Ming Lei =E5=86=99=E9=81=93:
> On Sat, Oct 08, 2022 at 04:00:10PM +0800, Yu Kuai wrote:
>> Hi,
>>
>> =E5=9C=A8 2022/10/08 10:50, kernel test robot =E5=86=99=E9=81=93:
>>> Greeting,
>>>
>>> FYI, we noticed a -10.6% regression of fio.read_iops due to commit:
>>
>> I don't know how this is working but I'm *sure* this commit won't affect
> =

> Looks it is wrong to move
> =

> 	wbt_set_write_cache(q, test_bit(QUEUE_FLAG_WC, &q->queue_flags));
> =

> before rq_qos_add() in wbt_init().
> =

> Without adding wbt rq_qos, wbt_set_write_cache is just a nop.

Yes, I got it now, I'm being foolish here.

I missed that "rwb->wc" is got by rq_qos in wbt_set_write_cache(), which
is NULL before rq_qos_add(). By the way, it's interesting that how read
performance is affected, I still don't know why yet...

Thanks,
Kuai
> =

> =

> thanks,
> Ming
> =

> .
>=20

--===============5508353806307322110==--

