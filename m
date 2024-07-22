Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0BB8F5E;
	Mon, 22 Jul 2024 18:15:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721672144; cv=none; b=iDwRSTsVIhaFMFxQnt3rvYRAlYQ896ygh5ZhsuahVv4NzJHMyPlJy29uLd57dKnSTZgRQOrHkf8zYERc3YBdN/bugwHiHh6C+ObcuzsiDzLMMCquvwzLLqHB/n0zCEOQ9VnCnbdaul/KhaSnUr6ewbafEAH51aEs7ZCD4A8kS7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721672144; c=relaxed/simple;
	bh=jav95XNnmKmffO2quaMHjVzZ8ifo10whe7Uz1+kTy1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IoMHEVnuBgmhOYv59rpm4SZUNOolXtWJK8WcLsAM0GuRfG0I7G9w3DXnOKMf73EVPfsVOToWPi8NISJMKTUgBHUZsGGY9BpLeI+BsAbAz3yYDsiAm4a+/lU3a2EQDWihIqHcdApUcZZTgDAjALHfez5sjKakPzoeT+uZbxsDHwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AjXi1Myw; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AjXi1Myw"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7a03ada9660so1087808a12.3;
        Mon, 22 Jul 2024 11:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721672142; x=1722276942; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2ccprAgCrF5Nw+4sYBOwRItdPUCn9FZWwH6R8A6Krw=;
        b=AjXi1Mywk0GPOZxR8a9kKCptCBriwmm4LXdzyLCrLirD3AkWBhMq0CO46Jc2sgN9PU
         aYwzyDSA0sjuaez/RV7ONL3ANeCQYC04/C+YyYFnKl46ZtXf68t2m4u4RUUAAp8rv7BH
         Wd4Q73yGRNZsdi6TOSYAtzP1aqaXnY0WwHfVdaa+u/KSxXbUNxRkVvF2+6G074Dy5cwH
         FgTJ5YypGrFdEezQ/Wrma8Gv05S7Ow8U2axO227DSFuo374EX/H832n3ZPXEAgpwDjMS
         aFiIniT2NsV+q1n9uijPFuyiBrDlqFDobrx1yArrG3A0w7JfRNOHQ+XD7eifrETlN4jt
         CK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721672142; x=1722276942;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V2ccprAgCrF5Nw+4sYBOwRItdPUCn9FZWwH6R8A6Krw=;
        b=lhe69HquhmYlswBLjEFDg1K95vd1D7MCWyDU4TDbQM5a6SJDIp9LpEAaiG1cjMWF1W
         W7mTvtQEFyT6CFYZozBhCYPJYD2qIeRXeWqeXG4e+MBGZL+Gjvs70z2f99lqhdrEx0Gx
         V3aOT1cHvypJORuFtYdWV/hbrV23cLGtoKw9l3AblDaOt7cnUtvN8Sxi8h7Boj4beKrS
         H3K/sChE3DU5PeU822mTtXk/ZXWv3xNskukkps4UbsDOepz9xkf07h743GhlFB47awTN
         3PlHyl96RRM0hvnSdSo1W8ljEUeCNLXwc98JIy1dMInR/7eMeahJ4xPDGDLR8tbl26+a
         Y2rw==
X-Forwarded-Encrypted: i=1; AJvYcCV2NTxHj05pO9CmeQforPtWG2B1VXsxNh6VDAflvTT3FKG8Vgz9FB0u5rLm/vqSo7YNc9+gP01Z30ScCdgxVT+1iEkGY4Qhdw1GDhXqRnN8Mp1gkKNhacR6gIOxNQ==
X-Gm-Message-State: AOJu0YwEM+lxdLKVC+AOG97mIdWRw0/sQvjxnGBPo/x7rSoF6Y6AEjRn
	/4QNRGO9mmIVhp51HSZcyD4ycGCFudBA4NYMeNrON4XqA1Z693R6
X-Google-Smtp-Source: AGHT+IH+O5dRqhifq5FCrHGRke2OnkO93BjMMqZPL8+7xkKr3+Z/b2vHKp1sy/in751R1wn0qbQOqA==
X-Received: by 2002:a05:6a20:6a0c:b0:1c0:f17d:d81f with SMTP id adf61e73a8af0-1c4285d4cb9mr6302396637.21.1721672142242;
        Mon, 22 Jul 2024 11:15:42 -0700 (PDT)
Received: from localhost (dhcp-141-239-149-160.hawaiiantel.net. [141.239.149.160])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ccf7b2c5edsm7366670a91.3.2024.07.22.11.15.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 11:15:41 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Mon, 22 Jul 2024 08:15:40 -1000
From: Tejun Heo <tj@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: kernel test robot <oliver.sang@intel.com>,
	Suren Baghdasaryan <surenb@google.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Kees Cook <keescook@chromium.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Benno Lossin <benno.lossin@proton.me>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Christoph Lameter <cl@linux.com>, Dennis Zhou <dennis@kernel.org>,
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Wedson Almeida Filho <wedsonaf@gmail.com>, linux-mm@kvack.org,
	lkmm@lists.linux.dev
Subject: Re: [linus:master] [mm]  24e44cc22a:
 BUG:KCSAN:data-race_in_pcpu_alloc_noprof/pcpu_block_update_hint_alloc
Message-ID: <Zp6hzP7g_3nLOLfv@slm.duckdns.org>
References: <202407191651.f24e499d-oliver.sang@intel.com>
 <Zp6bMoDnUMxNrKos@boqun-archlinux>
 <Zp6cVgXJlzF4VOwl@slm.duckdns.org>
 <Zp6e1PWZbz4pkh9Z@boqun-archlinux>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zp6e1PWZbz4pkh9Z@boqun-archlinux>

Hello,

On Mon, Jul 22, 2024 at 11:03:00AM -0700, Boqun Feng wrote:
...
> For READ/WRITE_ONCE(), we will need to replace all write accesses and
> all out-of-lock read accesses to pcpu_nr_empty_pop_pages, like below.
> It's better in the sense that it doesn't rely on compiler behaviors on
> data races, not sure about the performance impact though.

The patch looks great and I doubt this would impact performance in any
noticeable way.

Thanks.

-- 
tejun
