Content-Type: multipart/mixed; boundary="===============7285451765409356089=="
MIME-Version: 1.0
From: Jens Axboe <axboe@kernel.dk>
To: lkp@lists.01.org
Subject: Re: [memcg] 0f12156dff: will-it-scale.per_process_ops -33.6% regression
Date: Tue, 07 Sep 2021 09:46:48 -0600
Message-ID: <dbc9955d-6c28-1dd5-b842-ef39a762aa3b@kernel.dk>
In-Reply-To: <20210907150757.GE17617@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============7285451765409356089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 9/7/21 9:07 AM, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed a -33.6% regression of will-it-scale.per_process_ops due =
to commit:
> =

> =

> commit: 0f12156dff2862ac54235fc72703f18770769042 ("memcg: enable accounti=
ng for file lock caches")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Are we at all worried about these? There's been a number of them
reported, basically for all the accounting enablements that have been
done in this merge window.

When io_uring was switched to use accounted memory, we did a bunch of
work to ameliorate the inevitable slowdowns that happen if you do
repeated allocs and/or frees and have memcg accounting enabled.

-- =

Jens Axboe

--===============7285451765409356089==--

