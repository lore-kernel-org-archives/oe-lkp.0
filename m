Content-Type: multipart/mixed; boundary="===============8186017335044126085=="
MIME-Version: 1.0
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
To: lkp@lists.01.org
Subject: Re: [PATCH v3] workqueue: Warn flushing of kernel-global workqueues
Date: Fri, 18 Mar 2022 07:25:04 +0900
Message-ID: <d1ed2184-00ee-9756-5ad2-7c8189634748@I-love.SAKURA.ne.jp>
In-Reply-To: <Yh0XmUtuuyaO9j8j@slm.duckdns.org>
List-Id: <oe-lkp.lists.linux.dev>

--===============8186017335044126085==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2022/03/01 3:42, Tejun Heo wrote:
> On Mon, Feb 28, 2022 at 11:03:47PM +0900, Tetsuo Handa wrote:
>> Then, what about this?
>> If this looks OK, I'll test this patch using linux-next via my tree.
> =

> Yeah, looks good to me. Can you boot test and fix the obvious ones before
> the pushing it to linux-next? It probably would be best if this is kept i=
n a
> separate branch together with all the fix-up patches. Once things settle
> enough, we should be able to route the patches through the wq tree to Lin=
us.
> =

> Thank you so much for doing this.
> =


This patch has been in linux-next.git as commit b9c20da356db1b39 ("workqueu=
e:
Warn flushing of kernel-global workqueues") since next-20220301, and I got =
no
failure reports. I think we can send this patch to linux.git in order to let
each module's developers to write their patches. (I will drop this patch fr=
om
my tree when you pick up this patch.)
--===============8186017335044126085==--

