Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E63317700
	for <oe-lkp@lists.linux.dev>; Sat, 16 Aug 2025 07:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755329242; cv=none; b=eRH2UeHqr4mTxYkewmfU43eGCK2ISm6lryFrkyM/5w6Lpb58Xj/wBlceRDJxKsimTXY4pBehX3D2edhFjfutF3YtzcH8r9VHgSJtJGSZK4wXCwEiO+UKnqMHNBO/6753OpoVFr8BNFciPKiYFF6XwmCh+6TSR4xAMVOKYcOL21s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755329242; c=relaxed/simple;
	bh=6t+pWXtNvn3PngcOHMQ0az8IKzQqpXpauzoUr3nAI3k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dMikzEBLVucGg6J+xP7I6DwyHc0OVjgKN2FTKdvy2nFR3galgreViRXOEepwt2tc7BRoBvXiOd/Wr/UtbOCzMniP7JEvsWSf3zWKDQ/0TtFhjLmGN7wfFZdtDWtwbwim1mXtxBkPaJzkBbAamLMtN02JFkA7B6wR5AQ75LkiRqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=eDaYOBe8; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="eDaYOBe8"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-afcb78fb04cso413423566b.1
        for <oe-lkp@lists.linux.dev>; Sat, 16 Aug 2025 00:27:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1755329236; x=1755934036; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FpiVReBk4pxi7WdSyaid9+sMC8akMMwfHAVHbbVirOA=;
        b=eDaYOBe8EaQSrhtmVuShM6ChsSqOZSpYfbHuVIQuvq+twXpfTBztox66vmCeTEWSDU
         WxS9k3fmyd43oyL/DlL6eYTFMrxgXGugwxVzSU3ShnAxDD4vIXrQzmdKzGs82vv5NeWq
         eBMyTD8pzXV3DlXOPhLLfLcWoxHirVL8MWwQ5LGp6bTOf3qNfXcmqYyRZM/LiYyeuKPu
         IJX93t5zjNGC1W/XesbAON98PdB01fE6Vyd67KcPHfNm+5snVxQ+ugNC4WLKg7ccQ6K4
         aKBlIcQMj1aD+AISraRqiSrR1+XobNb9K7Cp78QH/kQTh46j9JS11iUXxbzitdMt1FmG
         KQdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755329236; x=1755934036;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FpiVReBk4pxi7WdSyaid9+sMC8akMMwfHAVHbbVirOA=;
        b=KPt1DPltTZXUnHG/ZBm8WkVeFv2NGKsTrX1191hD3tAUW2JrJVxYkQplVV1GVQZJl8
         3n21VOAIn5hY2Orc9IIVJUibjylvZ2WkrCx74sD5h6mRQhoRgm8S3bw35wCYxnpWW/Z6
         suonS35p9ndanNfdZVDZDrl21ruA4zAhzJqDxpun/bTA1+HS3yUNF7t7m61flLLsI+2i
         rHVgEh6f/2kBVw/ucAKceki+mEDCOoWSH7Wcd4vpNLGvanItwo6Yy9U41B2Ntidu60fY
         l3960wzFKzfQO3Ws3TjDw3qYYhhNod7dkRVCSMTZpaeyr4DNxs2752YtVbfukaTAsj27
         pALA==
X-Forwarded-Encrypted: i=1; AJvYcCWo9eoYb8I4Rv16/qFrngzoembyVC66IuI3GuTjffXSHDIzExH3sDieyKr3nOl/CcUSj8duhxY=@lists.linux.dev
X-Gm-Message-State: AOJu0YzfmRVvhx4clfkJ0nSkbn3LBHiDN7pVxZFtMNFhV06LBsovUJuu
	/32s45hVuEJqrICwaYr3hhbyQkdD95iFdTLllTYMnuQmkQSUFR6TVS6RxQsBEVkiGw==
X-Gm-Gg: ASbGncvwRaBtDN3KyruxttS/5no8v17dSfZb74orNxyP9iWb8Wewb5EZYuYxKhXwu1L
	spdFj6sChoSSymxoQMNdAiEj3djX+HLvzxka1+Ciok2AviC431obN9GHU3zG4Dm62QvAGSNd1Z6
	qwW5XdgrfEOK+NjP/BF2WNWCcU7mvez//k8aZkRgCAiO0dom+Jcy5JvsHAfqX0s+F3FBdQu/M5u
	S2qykWPJvL8bZrG42ypPWsvX+CQYqAApziOuBMDtgVDNFePJ2q7TLbNv+BY8ui2OtbB2NoRB8xm
	SQXHI0Sm9K0ypL93JbglDYNofyrcf7c0SkrcncQRS5drWkFRZAS4ehlsZmN8tavvhnIHD++16lx
	tN232fHToiQE=
X-Google-Smtp-Source: AGHT+IFg7imxaFEagNP0U5Ayia7U3tygLpXsVf6xKmyOpZitxVfNDophojGzUA2/MzddJEvPpEzhfA==
X-Received: by 2002:a17:906:6a0f:b0:ae8:4776:fbb1 with SMTP id a640c23a62f3a-afcdc03d360mr411785966b.11.1755329236202;
        Sat, 16 Aug 2025 00:27:16 -0700 (PDT)
Received: from localhost ([2a07:de40:b240:0:2ad6:ed42:2ad6:ed42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdcea179esm312796166b.57.2025.08.16.00.27.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 00:27:15 -0700 (PDT)
Date: Sat, 16 Aug 2025 07:27:14 +0000
From: Wei Gao <wegao@suse.com>
To: Kuniyuki Iwashima <kuniyu@google.com>
Cc: kernel test robot <oliver.sang@intel.com>,
	Menglong Dong <menglong8.dong@gmail.com>, kraig@google.com,
	lkp@intel.com, netdev@vger.kernel.org, dsahern@kernel.org,
	linux-kernel@vger.kernel.org, rcu@vger.kernel.org,
	edumazet@google.com, horms@kernel.org, oe-lkp@lists.linux.dev,
	kuba@kernel.org, pabeni@redhat.com, ncardwell@google.com,
	davem@davemloft.net, ltp@lists.linux.it,
	Menglong Dong <dongml2@chinatelecom.cn>
Subject: Re: [LTP] [PATCH net v2] net: ip: order the reuseport socket in
 __inet_hash
Message-ID: <aKAy0nu2p6X9sKUw@localhost>
References: <20250801090949.129941-1-dongml2@chinatelecom.cn>
 <202508110750.a66a4225-lkp@intel.com>
 <aJ_qbZDvDJwVoZGA@localhost>
 <CAAVpQUCEGiRjoobf69Jd5M9vnZyi0N6crNUgSBpDTGNfrap1cA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAAVpQUCEGiRjoobf69Jd5M9vnZyi0N6crNUgSBpDTGNfrap1cA@mail.gmail.com>

On Fri, Aug 15, 2025 at 07:35:10PM -0700, Kuniyuki Iwashima wrote:
> On Fri, Aug 15, 2025 at 7:18 PM Wei Gao <wegao@suse.com> wrote:
> >
> > On Mon, Aug 11, 2025 at 01:27:12PM +0800, kernel test robot wrote:
> > >
> > >
> > > Hello,
> > >
> > > kernel test robot noticed "BUG:KASAN:slab-use-after-free_in__inet_hash" on:
> > >
> > > commit: 859ca60b71ef223e210d3d003a225d9ca70879fd ("[PATCH net v2] net: ip: order the reuseport socket in __inet_hash")
> > > url: https://github.com/intel-lab-lkp/linux/commits/Menglong-Dong/net-ip-order-the-reuseport-socket-in-__inet_hash/20250801-171131
> > > base: https://git.kernel.org/cgit/linux/kernel/git/davem/net.git 01051012887329ea78eaca19b1d2eac4c9f601b5
> > > patch link: https://lore.kernel.org/all/20250801090949.129941-1-dongml2@chinatelecom.cn/
> > > patch subject: [PATCH net v2] net: ip: order the reuseport socket in __inet_hash
> > >
> > > in testcase: ltp
> > > version: ltp-x86_64-6505f9e29-1_20250802
> > > with following parameters:
> > >
> > >       disk: 1HDD
> > >       fs: ext4
> > >       test: fs_perms_simple
> > >
> > >
> > >
> > > config: x86_64-rhel-9.4-ltp
> > > compiler: gcc-12
> > > test machine: 4 threads 1 sockets Intel(R) Core(TM) i3-3220 CPU @ 3.30GHz (Ivy Bridge) with 8G memory
> > >
> > > (please refer to attached dmesg/kmsg for entire log/backtrace)
> > >
> > >
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <oliver.sang@intel.com>
> > > | Closes: https://lore.kernel.org/oe-lkp/202508110750.a66a4225-lkp@intel.com
> > >
> > >
> > > kern :err : [  128.186735] BUG: KASAN: slab-use-after-free in __inet_hash (net/ipv4/inet_hashtables.c:749 net/ipv4/inet_hashtables.c:800)
> >
> > This kasan error not related with LTP case, i guess it triggered by network
> > related process such as bind etc. I try to give following patch to fix
> > kasan error, correct me if any mistake, thanks.
> 
> Note that the report was for the patch in the mailing list
> and the patch was not applied to net-next.git nor net.git.
Thanks for note. 
Since this email sent to LTP group so i got this. Since
i'm interested in this 'kasan' problem, so trying to fix it.
> 
> 
> >
> > From: Wei Gao <wegao@suse.com>
> > Date: Sat, 16 Aug 2025 09:32:56 +0800
> > Subject: [PATCH v1] net: Fix BUG:KASAN:slab-use-after-free_in__inet_hash
> >
> > Reported-by: kernel test robot <oliver.sang@intel.com>
> > Closes: https://lore.kernel.org/oe-lkp/202508110750.a66a4225-lkp@intel.com
> > Signed-off-by: Wei Gao <wegao@suse.com>
> > ---
> >  include/linux/rculist_nulls.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/include/linux/rculist_nulls.h b/include/linux/rculist_nulls.h
> > index da500f4ae142..5def9009c507 100644
> > --- a/include/linux/rculist_nulls.h
> > +++ b/include/linux/rculist_nulls.h
> > @@ -57,7 +57,7 @@ static inline void hlist_nulls_del_init_rcu(struct hlist_nulls_node *n)
> >   * @node: element of the list.
> >   */
> >  #define hlist_nulls_pprev_rcu(node) \
> > -       (*((struct hlist_nulls_node __rcu __force **)&(node)->pprev))
> > +       (*((struct hlist_nulls_node __rcu __force **)(node)->pprev))
> >
> >  /**
> >   * hlist_nulls_del_rcu - deletes entry from hash list without re-initialization
> > @@ -175,7 +175,7 @@ static inline void hlist_nulls_add_before_rcu(struct hlist_nulls_node *n,
> >  {
> >         WRITE_ONCE(n->pprev, next->pprev);
> >         n->next = next;
> > -       rcu_assign_pointer(hlist_nulls_pprev_rcu(n), n);
> > +       rcu_assign_pointer(hlist_nulls_pprev_rcu(next), n);
> >         WRITE_ONCE(next->pprev, &n->next);
> >  }
> >
> > --
> > 2.43.0
> >
