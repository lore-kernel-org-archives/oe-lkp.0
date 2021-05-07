Content-Type: multipart/mixed; boundary="===============6740433342451163180=="
MIME-Version: 1.0
From: Roman Gushchin <guro@fb.com>
To: lkp@lists.01.org
Subject: Re: [percpu] ace7e70901: aim9.sync_disk_rw.ops_per_sec -2.3% regression
Date: Fri, 07 May 2021 10:52:22 -0700
Message-ID: <YJV+Vn9eGfIlxDQE@carbon.dhcp.thefacebook.com>
In-Reply-To: <20210507030606.GA27263@xsang-OptiPlex-9020>
List-Id: <oe-lkp.lists.linux.dev>

--===============6740433342451163180==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 07, 2021 at 11:06:06AM +0800, Oliver Sang wrote:
> hi Roman,
>  =

> On Thu, May 06, 2021 at 12:54:59AM +0000, Roman Gushchin wrote:
> > Ping
> =

> sorry for late.
> =

> the new patch makes the performance a little better but still has
> 1.9% regression comparing to
> f183324133 ("percpu: implement partial chunk depopulation")

Hi Oliver!

Thank you for testing it!

Btw, can you, please, confirm that the regression is coming specifically
from ace7e70901 ("percpu: use reclaim threshold instead of running for ever=
y page")?
I do see *some* regression in my setup, but the data is very noisy, so I'm =
not sure
I can confirm it.

Thanks!
--===============6740433342451163180==--

