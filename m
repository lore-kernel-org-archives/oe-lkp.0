Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04AC1B59A
	for <oe-lkp@lists.linux.dev>; Thu,  5 Dec 2024 14:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733408123; cv=none; b=TNyXMXtWhKc4LcX7BBpothFg2PpQ3HQC9VprU477osjnda4Glq9qkyiHLKXXl7Fk+2xDaSfQdhdzu4Fmf2MU6pJnQW0T6xyaiUjDYKpDBSwAO3uCVJJPaCrUn/ylr6u8jEBfUVIhOnT3ahwNKOjI2F8wgonLq5iYRHj1MLh831c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733408123; c=relaxed/simple;
	bh=Fl2IFzoozfYni/8G1Lh5cng8V9BjfttNXLLeTVJ/puk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fEIoYAcjm3BscATv9hTboJT+ueRuzcn5kwePl+lUhp8ivzGH/qJ8P0zYv/p1L6WHDMbRNjFBhfs1gMgJHnRGdFVJgVV7mT/4EC/7YlBx0EbBdP4Jg84gjXxzWuXza0FbUH6q9ajR0X1DW3XPM1ZN5JQG+fAAkQ0onddBhZmqD9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iGkCKWEV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iGkCKWEV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E78C4CED1;
	Thu,  5 Dec 2024 14:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733408123;
	bh=Fl2IFzoozfYni/8G1Lh5cng8V9BjfttNXLLeTVJ/puk=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=iGkCKWEVDATu8moOO+7ShARS88KMOijIOjBI5mr6rLaCoz1UruX/YYE8Bcp0HUOh0
	 ayzZQB6Eq5JRxsqSeOhA4OohIeMXlYCKQSXpuc8ggHQzNeErTn33ozoSeRA17W7Wc+
	 QE7cplv/c8JhRDMKF3vTsyg1OeIAQ9ZCs8+AunaxOUx9ngmHmrNleseqqH0xYiuKMl
	 anIY3L6oNCFFSu4ycQaXO2VGUwBKmiG9Sa5qVO9yx3MnKxV61IwFwT1GA65+oZ61Ey
	 aVnhFdvVCfeFTMN3NqNG3Au/FLId5l1nVghQQWo0clrCGYNFGQeOmPtGryqYBmfIda
	 roXCvEKIIj5hQ==
Message-ID: <4db12601388722f4d1dd74bd5b3c407f5a77f3c5.camel@kernel.org>
Subject: Re: [snitzer:cel-nfsd-next-6.12-rc5] [nfsd]  b4be3ccf1c:
 fsmark.app_overhead 92.0% regression
From: Jeff Layton <jlayton@kernel.org>
To: Oliver Sang <oliver.sang@intel.com>, Chuck Lever III
	 <chuck.lever@oracle.com>
Cc: Mike Snitzer <snitzer@redhat.com>, "oe-lkp@lists.linux.dev"
	 <oe-lkp@lists.linux.dev>, "lkp@intel.com" <lkp@intel.com>
Date: Thu, 05 Dec 2024 06:15:22 -0800
In-Reply-To: <Z1FV5AVaNePiqTNm@xsang-OptiPlex-9020>
References: <202411071017.ddd9e9e2-oliver.sang@intel.com>
	 <ZzYLKgijp6OeGF2A@tissot.1015granger.net>
	 <ZzrydFbfitmuKeFd@xsang-OptiPlex-9020>
	 <3E2B7563-E2B0-4C1D-A3D2-C0A2F1B27225@oracle.com>
	 <Z06Qs380yk7NCNjJ@xsang-OptiPlex-9020>
	 <347A9ACC-8701-4518-81B1-D099B637265D@oracle.com>
	 <Z1FV5AVaNePiqTNm@xsang-OptiPlex-9020>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=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
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-2.fc40) 
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Thu, 2024-12-05 at 15:27 +0800, Oliver Sang wrote:
> hi, Chuck Lever,
>=20
> On Tue, Dec 03, 2024 at 02:54:47PM +0000, Chuck Lever III wrote:
> >=20
> >=20
> > > On Dec 3, 2024, at 12:01=E2=80=AFAM, Oliver Sang <oliver.sang@intel.c=
om> wrote:
> > >=20
> > > hi, Chuck Lever,
> > >=20
> > > On Mon, Dec 02, 2024 at 03:40:49PM +0000, Chuck Lever III wrote:
> > > >=20
> > > >=20
> > > > > On Nov 18, 2024, at 2:53=E2=80=AFAM, Oliver Sang <oliver.sang@int=
el.com> wrote:
> > > > >=20
> > > > > hi, Chuck Lever,
> > > > >=20
> > > > > On Thu, Nov 14, 2024 at 09:37:30AM -0500, Chuck Lever wrote:
> > > > > > On Thu, Nov 07, 2024 at 12:55:02PM +0800, kernel test robot wro=
te:
> > > > > > >=20
> > > > > > > hi, Jeff Layton,
> > > > > > >=20
> > > > > > > in commit message, it is mentioned the change is expected to =
solve the
> > > > > > > "App Overhead" on the fs_mark test we reported in
> > > > > > > https://lore.kernel.org/oe-lkp/202409161645.d44bced5-oliver.s=
ang@intel.com/
> > > > > > >=20
> > > > > > > however, in our tests, there is sill similar regression. at t=
he same
> > > > > > > time, there is still no performance difference for fsmark.fil=
es_per_sec
> > > > > > >=20
> > > > > > >  2015880 =C2=B1  3%     +92.0%    3870164        fsmark.app_o=
verhead
> > > > > > >    18.57            +0.0%      18.57        fsmark.files_per_=
sec
> > > > > >=20
> > > > > > Because the most recent version of this commit does not appear =
to
> > > > > > address the reported regression, Jeff suggested dropping it. I'=
ve
> > > > > > done that in the branch below, which is being prepared for v6.1=
3.
> > > > > >=20
> > > > > >=20
> > > > > > > another thing is our bot bisect to this commit in repo/branch=
 as below detail
> > > > > > > information. if there is a more porper repo/branch to test th=
e patch, could
> > > > > > > you let us know? thanks a lot!
> > > > > >=20
> > > > > > The proper branch to test is:
> > > > > >=20
> > > > > > https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/l=
og/?h=3Dnfsd-next
> > > > >=20
> > > > > thanks for information! this repo is under bot's monitoring.
> > > > > unfortunately, our cluster run into problems these days and need =
some time
> > > > > to full back. so if there is still regression reports, maybe will=
 delay to
> > > > > a later time.
> > > >=20
> > > > Hello Oliver -
> > > >=20
> > > > To avoid regressing v6.13, we postponed this series.
> > > >=20
> > > > The series is now in=20
> > > >=20
> > > >  https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/log/=
?h=3Dnfsd-testing
> > > >=20
> > > > And I would like the robot to include that branch in regular
> > > > test runs going forward. I will try to push new patches there
> > > > first before pushing them to nfsd-next.
> > >=20
> > > got it. this nfsd-testing is already in our monitor.
> > >=20
> > > 07b2337dc158fb (cel/nfsd-testing) nfsd: add support for FATTR4_OPEN_A=
RGUMENTS
> > > 54b0e9c3727d2f nfs_common: make include/linux/nfs4.h include generate=
d nfs4_1.h
> > > fcc756b92ce832 nfsd: fix handling of delegated change attr in CB_GETA=
TTR
> > > a354743d35b49b nfsd: trace: remove redundant stateid even deleg_recal=
l
> > > 40384c840ea194 (tag: v6.13-rc1,
> >=20
> > That's not yet a complete set of revised patches. We'll get
> > there in a few days.
>=20
> got it. thanks for information.
>=20
> >=20
> >=20
> > > at the same time, I triggered same tests for original report upon 07b=
2337dc158fb
> > > and v6.13-rc1, will update you results later.
>=20
> if just comparing 07b2337dc158fb with v6.13-rc1, there is no big diff for
> fsmark.app_overhead.
>=20
>        v6.13-rc1 07b2337dc158fb33e7af288b74c
> ---------------- ---------------------------
>          %stddev     %change         %stddev
>              \          |                \
>    3110649            -1.3%    3070867        fsmark.app_overhead
>      18.58            -0.3%      18.52        fsmark.files_per_sec
>=20
> but as above, seems the 07b2337dc158fb is not the correct commit to test?
>=20

Yes, I wouldn't expect to see a regression with that patch. That commit
just adds support for FATTR4_OPEN_ARGUMENTS, without any real change in
functionality.  I think Chuck was planning to put the rest of the
patches back in and just disable
OPEN4_SHARE_ACCESS_WANT_OPEN_XOR_DELEGATION support. With that you
should be able to see the regression again, but I don't see those
patches in his tree just yet.


> we noticed it's now
>=20
> b95256b0edb43 (cel/nfsd-testing) nfsd: prepare delegation code for handin=
g out *_ATTRS_DELEG delegations
> 77152578a5c16 nfsd: rename NFS4_SHARE_WANT_* constants to OPEN4_SHARE_ACC=
ESS_WANT_*
> 019cb8ea1e9d4 nfsd: switch to autogenerated definitions for open_delegati=
on_type4
> 07b2337dc158f nfsd: add support for FATTR4_OPEN_ARGUMENTS
> 54b0e9c3727d2 nfs_common: make include/linux/nfs4.h include generated nfs=
4_1.h
> fcc756b92ce83 nfsd: fix handling of delegated change attr in CB_GETATTR
> a354743d35b49 nfsd: trace: remove redundant stateid even deleg_recall
> 40384c840ea19 (tag: v6.13-rc1,
>=20
> if you need us test b95256b0edb43, please let us know. or you could reque=
st us
> when the branch is ready. thanks!
>=20
> >=20
> > Thanks!
> >=20
> >=20
> > --
> > Chuck Lever
> >=20
> >=20

--=20
Jeff Layton <jlayton@kernel.org>
