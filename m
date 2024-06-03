Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B46112CDBA
	for <oe-lkp@lists.linux.dev>; Mon,  3 Jun 2024 15:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717427316; cv=none; b=DT4kjXUztLkd/I6RbaaDDZTfIQgQD5S/WLiMeRYo4DqyUQfZKZQseOfSVk3cB2qyBV5tmSrBYcURigWBE8LuNLlfIl1dtuLNOeJgQB7bNIxxMT0dL5Nl3sngNBf0a1SIuWxEEQUSCoP6W+cmrozw3F7orUKzABHShSR63XGwCIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717427316; c=relaxed/simple;
	bh=7U7MTjMVkjA4JwIdG6Syu2QJBVQhOPBbxFJHqeAc4NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=UDc6OxvBuxQzHCF4xPLhf1siuyqr7/r2z46/6wlpcBEPcVWau9GYk1ss9wyhZxUSTTeLZchztluaXnLGKqnARrTfaAjGLxaFQoDEEk/YR7VWjIemSTqW7dRRfG6rDeyfLwY99c83yCogwqdb04JFv8JBzYDN6nPQIUT83vDFfj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YZurQI7a; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YZurQI7a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717427314;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7WTDKaHtkHDNxGHyLp1oUvN+cHT5VenD6c5Rq/FFi44=;
	b=YZurQI7a4efG9PmRkbEGTprWjmnROzDzFlX3S7+AcGhXO9cfeEIZFkeEknVhG8LIH1pSuN
	1FTVy6myNCO0txNALmhksEItbSPb/li0+o8kBDiV/d9+Xbf5U+gh1ZiAVrrAFolZy/0kpc
	jkjJ91Vsmvx3E1arVaCXRVcehakrqeE=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-18-y3vxm1cNNA-RFvvuMxO89Q-1; Mon, 03 Jun 2024 11:08:31 -0400
X-MC-Unique: y3vxm1cNNA-RFvvuMxO89Q-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-795041d6c8bso6480685a.1
        for <oe-lkp@lists.linux.dev>; Mon, 03 Jun 2024 08:08:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717427310; x=1718032110;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7WTDKaHtkHDNxGHyLp1oUvN+cHT5VenD6c5Rq/FFi44=;
        b=skGuQRWpQJ0l3gzDWm+NfHy4MpH3kI4Bto5lqxuY2vaUR+AsGc0SUV+2N7sJ38T3un
         ddxw7/4AOdKjfZdqV8Si9C8/WhQtZvm70UnVj/FE34jxU3tv/WPa5a9qAVnP851AysW9
         AAuchKnB2gD7VUmK2mgSt0VCtjobYaWLIVanF6BV94OPNXECG0m3ocXZEb+GZOD/QHhs
         rY6QdEJ/AIQfDpo9tiEPfXHwiCWMAn2F+6UqPil76fyBd6mHVX1Z7ba0JEhCnSOgQ9rq
         CHpigRxspJEd91ynR1ZiTCor0DfYzi5hTy/LEe2DMBleGnlpakgWDubSlNf0lEI0lMn/
         Xvjg==
X-Forwarded-Encrypted: i=1; AJvYcCXImzpqr+dpF8MR+d32M9qSixrLBF2RV14Rl7oCUXYq7QYIFfLGtLQU9cSNfPDWryVW/S7pmkRCwTLjX/NMKs7w4GyHeCws
X-Gm-Message-State: AOJu0YxaWg2adC+7ooz+lHv0xml1PT7Ct+iwoLR79js62BkQbpwWotc4
	ePiAXF6QExVMviXYoqrivgM47xuWxlt/XrnAXeBpm4MtK4728eIih1Up7+RiZ9RiX9DmvQFgXbn
	UBT9LOVSqYuIHQacL04Gcx+ziRcV3emFGb4ZGovMO/qOielHk+SYA2Q==
X-Received: by 2002:a05:620a:2603:b0:794:c6a0:258a with SMTP id af79cd13be357-794f5cd378cmr1002215085a.4.1717427310244;
        Mon, 03 Jun 2024 08:08:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzP9CEiIlpxklGaIH1jTwQZOdprD5lMjaARwntIlugqLv198+69+4KsoerwcBYSxj6OBsDvQ==
X-Received: by 2002:a05:620a:2603:b0:794:c6a0:258a with SMTP id af79cd13be357-794f5cd378cmr1002207985a.4.1717427309501;
        Mon, 03 Jun 2024 08:08:29 -0700 (PDT)
Received: from x1n (pool-99-254-121-117.cpe.net.cable.rogers.com. [99.254.121.117])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-794f3172d94sm289850185a.99.2024.06.03.08.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jun 2024 08:08:29 -0700 (PDT)
Date: Mon, 3 Jun 2024 11:08:26 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Yang Shi <shy828301@gmail.com>,
	kernel test robot <oliver.sang@intel.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Vivek Kasireddy <vivek.kasireddy@intel.com>,
	Rik van Riel <riel@surriel.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Matthew Wilcox <willy@infradead.org>,
	Christopher Lameter <cl@linux.com>, linux-mm@kvack.org
Subject: Re: [linus:master] [mm] efa7df3e3b:
 kernel_BUG_at_include/linux/page_ref.h
Message-ID: <Zl3cakfiRsPQDb8q@x1n>
References: <202405311534.86cd4043-lkp@intel.com>
 <CAHbLzkpMhEuGkQDGWrK1LhvZ-ZxTJkV1xjmn-nRGZMH4U+F5ZA@mail.gmail.com>
 <890e5a79-8574-4a24-90ab-b9888968d5e5@redhat.com>
 <ZlpcRnuZUEYJJ0JA@x1n>
 <CAHbLzkrRw-xf819gYJwRQ=-u971LQYnB2FNJMkN=s6u-pJ4Z8g@mail.gmail.com>
 <CAHbLzkoB+oFTxtVYpeXQvko2q9HUVzUYrr83S6M6PUmXDQpkag@mail.gmail.com>
 <0edfcfed-e8c4-4c46-bbce-528c07084792@redhat.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <0edfcfed-e8c4-4c46-bbce-528c07084792@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Jun 01, 2024 at 08:22:21AM +0200, David Hildenbrand wrote:
> On 01.06.24 02:59, Yang Shi wrote:
> > On Fri, May 31, 2024 at 5:01 PM Yang Shi <shy828301@gmail.com> wrote:
> > > 
> > > On Fri, May 31, 2024 at 4:25 PM Peter Xu <peterx@redhat.com> wrote:
> > > > 
> > > > On Fri, May 31, 2024 at 07:46:41PM +0200, David Hildenbrand wrote:
> > > > > try_grab_folio()->try_get_folio()->folio_ref_try_add_rcu()
> > > > > 
> > > > > Is called (mm-unstable) from:
> > > > > 
> > > > > (1) gup_fast function, here IRQs are disable
> > > > > (2) gup_hugepte(), possibly problematic
> > > > > (3) memfd_pin_folios(), possibly problematic
> > > > > (4) __get_user_pages(), likely problematic
> > > > > 
> > > > > (1) should be fine.
> > > > > 
> > > > > (2) is possibly problematic on the !fast path. If so, due to commit
> > > > >      a12083d721d7 ("mm/gup: handle hugepd for follow_page()") ? CCing Peter.
> > > > > 
> > > > > (3) is possibly wrong. CCing Vivek.
> > > > > 
> > > > > (4) is what we hit here
> > > > 
> > > > I guess it was overlooked because try_grab_folio() didn't have any comment
> > > > or implication on RCU or IRQ internal helpers being used, hence a bit
> > > > confusing.  E.g. it has different context requirement on try_grab_page(),
> > > > even though they look like sister functions.  It might be helpful to have a
> > > > better name, something like try_grab_folio_rcu() in this case.
> > > > 
> > > > Btw, none of above cases (2-4) have real bug, but we're looking at some way
> > > > to avoid triggering the sanity check, am I right?  I hope besides the host
> > > > splash I didn't overlook any other side effect this issue would cause, and
> > > > the splash IIUC should so far be benign, as either gup slow (2,4) or the
> > > > newly added memfd_pin_folios() (3) look like to have the refcount stablized
> > > > anyway.
> > > > 
> > > > Yang's patch in the other email looks sane to me, just that then we'll add
> > > > quite some code just to avoid this sanity check in paths 2-4 which seems
> > > > like an slight overkill.
> > > > 
> > > > One thing I'm thinking is whether folio_ref_try_add_rcu() can get rid of
> > > > its RCU limitation. It boils down to whether we can use atomic_add_unless()
> > > > on TINY_RCU / UP setup too?  I mean, we do plenty of similar things
> > > > (get_page_unless_zero, etc.) in generic code and I don't understand why
> > > > here we need to treat folio_ref_try_add_rcu() specially.
> > > > 
> > > > IOW, the assertions here we added:
> > > > 
> > > >          VM_BUG_ON(!in_atomic() && !irqs_disabled());
> > > > 
> > > > Is because we need atomicity of below sequences:
> > > > 
> > > >          VM_BUG_ON_FOLIO(folio_ref_count(folio) == 0, folio);
> > > >          folio_ref_add(folio, count);
> > > > 
> > > > But atomic ops avoids it.
> > > 
> > > Yeah, I didn't think of why atomic can't do it either. But is it
> > > written in this way because we want to catch the refcount == 0 case
> > > since it means a severe bug? Did we miss something?
> > 
> > Thought more about it and disassembled the code. IIUC, this is an
> > optimization for non-SMP kernel. When in rcu critical section or irq
> > is disabled, we just need an atomic add instruction.
> > folio_ref_add_unless() would yield more instructions, including branch
> > instruction. But I'm wondering how useful it would be nowadays. Is it
> > really worth the complexity? AFAIK, for example, ARM64 has not
> > supported non-SMP kernel for years.
> > 
> > My patch actually replaced all folio_ref_add_unless() to
> > folio_ref_add() for slow paths, so it is supposed to run faster, but
> > we are already in slow path, it may be not measurable at all. So
> > having more simple and readable code may outweigh the potential slight
> > performance gain in this case?
> 
> Yes, we don't want to use atomic RMW that return values where we can use
> atomic RMW that don't return values. The former is slower and implies a
> memory barrier, that can be optimized out on some arcitectures (arm64 IIRC)
> 
> We should clean that up here, and make it clearer that the old function is
> only for grabbing a folio if it can be freed concurrently -- GUP-fast.

Note again that this only affects TINY_RCU, which mostly implies
!PREEMPTION and UP.  It's a matter of whether we prefer adding these bunch
of code to optimize that.

Also we didn't yet measure that in a real workload and see how that
"unless" plays when buried in other paths, but then we'll need a special
kernel build first, and again I'm not sure whether it'll be worthwhile.

Thanks,

-- 
Peter Xu

