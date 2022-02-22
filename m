Content-Type: multipart/mixed; boundary="===============2271306861461475621=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH] workqueue: Use private WQ for schedule_on_each_cpu() API
Date: Tue, 22 Feb 2022 07:29:50 -1000
Message-ID: <YhUdjip4VSWe4zDO@slm.duckdns.org>
In-Reply-To: <3a20c799-c18e-dd3a-3161-fee6bca1491e@I-love.SAKURA.ne.jp>
List-Id: <oe-lkp.lists.linux.dev>

--===============2271306861461475621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 21, 2022 at 07:38:09PM +0900, Tetsuo Handa wrote:
> Since schedule_on_each_cpu() calls schedule_work_on() and flush_work(),
> we should avoid using system_wq in order to avoid unexpected locking
> dependency.

I don't get it. schedule_on_each_cpu() is flushing each work item and thus
shouldn't need its own flushing domain. What's this change for?

Thanks.

-- =

tejun
--===============2271306861461475621==--

