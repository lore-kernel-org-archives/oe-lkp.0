Content-Type: multipart/mixed; boundary="===============1335255637228788679=="
MIME-Version: 1.0
From: Michal Hocko <mhocko@suse.cz>
To: lkp@lists.01.org
Subject: Re: OOM in v4.8
Date: Wed, 12 Oct 2016 10:43:42 +0200
Message-ID: <20161012084342.GF17128@dhcp22.suse.cz>
In-Reply-To: <24ea68df-8b6c-5319-a8ef-9c4f237cfc2a@intel.com>
List-Id: <oe-lkp.lists.linux.dev>

--===============1335255637228788679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed 12-10-16 16:24:47, Aaron Lu wrote:
> On 10/12/2016 04:00 PM, Michal Hocko wrote:
[...]
> > which is an atomic high order request that failed which is not all that
> > unexpected when the system is low on memory. The allocation failure
> > report is hard to read because of unexpected end-of-lines but I suspect
> =

> Sorry about that, I'll try to find out why dmesg is saved so ugly on
> that test box.

Not your fault. This seems to be 4bcc595ccd80 ("printk: reinstate
KERN_CONT for printing continuation lines")

> > that again we are not able to allocate because of the CMA standing in
> > the way. I wouldn't call the above failure critical though.
>  =

> I'll test that commit and v4.8 again with cma=3D0 added to cmdline.

Thanks!

-- =

Michal Hocko
SUSE Labs

--===============1335255637228788679==--

