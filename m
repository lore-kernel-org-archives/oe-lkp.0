Content-Type: multipart/mixed; boundary="===============4870310812208558044=="
MIME-Version: 1.0
From: Luis Chamberlain <mcgrof@kernel.org>
To: lkp@lists.01.org
Subject: Re: [fs] 7e84dfbf1b: BUG:unable_to_handle_page_fault_for_address
Date: Thu, 09 Dec 2021 14:48:01 -0800
Message-ID: <YbKHoXui9NdAXICi@bombadil.infradead.org>
In-Reply-To: <20211209142017.GB25654@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============4870310812208558044==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2021 at 10:20:17PM +0800, kernel test robot wrote:
> =

> =

> Greeting,
> =

> FYI, we noticed the following commit (built with clang-14):
> =

> commit: 7e84dfbf1b7e4bef111ce5db72b4cc7421bd2a9d ("fs: move namespace sys=
ctls and declare fs base directory")
> https://github.com/hying-caritas/linux.git mmotm-2021-11-29

Likewise, there were some issues with earlier incarnations of the
patch series which were fixed later, can you try to reproduce with
the latest linux-next?

  Luis
--===============4870310812208558044==--

