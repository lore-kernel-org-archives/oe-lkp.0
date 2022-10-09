Content-Type: multipart/mixed; boundary="===============3270423537497409778=="
MIME-Version: 1.0
From: Ming Lei <ming.lei@redhat.com>
To: lkp@lists.01.org
Subject: Re: [blk] 8c5035dfbb: fio.read_iops -10.6% regression
Date: Sun, 09 Oct 2022 16:43:04 +0800
Message-ID: <Y0KJmODYOh83OtGa@T590>
In-Reply-To: <d5279fc2-38b3-6d20-4404-604d5c7277e2@huaweicloud.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============3270423537497409778==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 08, 2022 at 04:00:10PM +0800, Yu Kuai wrote:
> Hi,
> =

> =E5=9C=A8 2022/10/08 10:50, kernel test robot =E5=86=99=E9=81=93:
> > Greeting,
> > =

> > FYI, we noticed a -10.6% regression of fio.read_iops due to commit:
> =

> I don't know how this is working but I'm *sure* this commit won't affect

Looks it is wrong to move =


	wbt_set_write_cache(q, test_bit(QUEUE_FLAG_WC, &q->queue_flags));

before rq_qos_add() in wbt_init().

Without adding wbt rq_qos, wbt_set_write_cache is just a nop.


thanks,
Ming

--===============3270423537497409778==--

