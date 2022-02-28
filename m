Content-Type: multipart/mixed; boundary="===============9200979091314179384=="
MIME-Version: 1.0
From: Tejun Heo <tj@kernel.org>
To: lkp@lists.01.org
Subject: Re: [PATCH v3] workqueue: Warn flushing of kernel-global workqueues
Date: Mon, 28 Feb 2022 08:42:33 -1000
Message-ID: <Yh0XmUtuuyaO9j8j@slm.duckdns.org>
In-Reply-To: <4165db50-1365-549a-eb77-6122c78d4814@I-love.SAKURA.ne.jp>
List-Id: <oe-lkp.lists.linux.dev>

--===============9200979091314179384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 28, 2022 at 11:03:47PM +0900, Tetsuo Handa wrote:
> Then, what about this?
> If this looks OK, I'll test this patch using linux-next via my tree.

Yeah, looks good to me. Can you boot test and fix the obvious ones before
the pushing it to linux-next? It probably would be best if this is kept in a
separate branch together with all the fix-up patches. Once things settle
enough, we should be able to route the patches through the wq tree to Linus.

Thank you so much for doing this.

-- =

tejun
--===============9200979091314179384==--

