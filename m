Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D91E6125
	for <oe-lkp@lists.linux.dev>; Mon,  5 Dec 2022 17:32:19 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id h33so11067109pgm.9
        for <oe-lkp@lists.linux.dev>; Mon, 05 Dec 2022 09:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wHyd9pKlC9WFHVrwobxVNYq4HVzMFaCc5ME41Vf/DS4=;
        b=tXcuoR9V6zHapsF2k42um/JNMg5G/jsVRshX0CWC9OKMH0uUifRsHiZ+sKnK1ucz6w
         DAr33L1RJNKC7+e0+y/DbbLxBAecH8KqhIcv5cUZQYBwSS+ccmEIQf4CuAa1kXy2DMw3
         SGtsVwaJLyUqmpYhTVg7S8pNptpBQgXO0oYo7ewY847llU0O9xki8GgL+GJmrOJ9+qy3
         Y67t3ex8vH4gDG+Oy4Jrwld+9WhaqXTPbka9JVSf9t3cA98+MEDa3rQZUrBeHq6C8nre
         1V8Q2UZ7oS3aHfTjlFWNv3n4KMWIKpCO9X2SpCm/g780PnpERu52pGZA4g0nhuklu4ig
         oRBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wHyd9pKlC9WFHVrwobxVNYq4HVzMFaCc5ME41Vf/DS4=;
        b=Z2xzqTOfQVIjguVyFg7Oxcx3rHkxNxDe1RLwaYoAay/qJ+8OYMVWHg/AwUd2VslEyY
         lvWLNT1sFifZ+kXbj6ouhRbPeqlOptrYx0akDSqqVwHgg5yJEioInYIXfEdALcUGv3NC
         5xNJAqt5Gar5BOA9FZGArnlufXC3Isc5+6K+HFFC2FnPPS1EaoFRKfVgVYWyYXIisWUz
         haO5jkjmpZ6cXtUG/Di/ftxU8tpUsmokMDjfTsR9yoOZRrpMTdKGT9wD5lFANNT/UXhd
         rmjDdoRzsq1pHuPnBRz8pM4xiQRypAF6yqxiBS340Rx/1X/+QQOFulLBfPhwliyEZZ/1
         57jQ==
X-Gm-Message-State: ANoB5pljFV6Ii0JU/d+LjCD9WTVUopt2FPKMXj3kSOoRbnNey4S1rybh
	AlD8P3v4Hf6nFcAO7YHEI1tOGA==
X-Google-Smtp-Source: AA0mqf5H6RmfXNSGuyQNg+3Xbnn5UEmDXz9z1UaDNDohTKkpmd3glPZwK/n7+3IkNQFbXk6SVJX+RQ==
X-Received: by 2002:a63:1747:0:b0:478:1391:fd14 with SMTP id 7-20020a631747000000b004781391fd14mr35684881pgx.112.1670261539381;
        Mon, 05 Dec 2022 09:32:19 -0800 (PST)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id s4-20020a17090a764400b0020087d7e778sm11218083pjl.37.2022.12.05.09.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 09:32:18 -0800 (PST)
Date: Mon, 5 Dec 2022 17:32:14 +0000
From: Sean Christopherson <seanjc@google.com>
To: kernel test robot <oliver.sang@intel.com>
Cc: Maxim Levitsky <mlevitsk@redhat.com>, oe-lkp@lists.linux.dev,
	lkp@intel.com, Paolo Bonzini <pbonzini@redhat.com>,
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
	xudong.hao@intel.com
Subject: Re: [linus:master] [KVM]  92e7d5c83a:
 kernel-selftests.kvm.triple_fault_event_test.fail
Message-ID: <Y44rHsJU9OdkxCHA@google.com>
References: <202212032146.b0347c81-oliver.sang@intel.com>
Precedence: bulk
X-Mailing-List: oe-lkp@lists.linux.dev
List-Id: <oe-lkp.lists.linux.dev>
List-Subscribe: <mailto:oe-lkp+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-lkp+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202212032146.b0347c81-oliver.sang@intel.com>

On Sat, Dec 03, 2022, kernel test robot wrote:
> 
> Greeting,
> 
> FYI, we noticed kernel-selftests.kvm.triple_fault_event_test.fail due to commit (built with gcc-11):
> 
> commit: 92e7d5c83aff124f49082585e57939ed24b59c5c ("KVM: x86: allow L1 to not intercept triple fault")
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

Should already be fixed.  Thanks!

commit df0bb47baa95aad133820b149851d5b94cbc6790
Author: Paolo Bonzini <pbonzini@redhat.com>
Date:   Wed Nov 30 11:14:35 2022 -0500

    KVM: x86: fix uninitialized variable use on KVM_REQ_TRIPLE_FAULT
    
    If a triple fault was fixed by kvm_x86_ops.nested_ops->triple_fault (by
    turning it into a vmexit), there is no need to leave vcpu_enter_guest().
    Any vcpu->requests will be caught later before the actual vmentry,
    and in fact vcpu_enter_guest() was not initializing the "r" variable.
    Depending on the compiler's whims, this could cause the
    x86_64/triple_fault_event_test test to fail.
    
    Cc: Maxim Levitsky <mlevitsk@redhat.com>
    Fixes: 92e7d5c83aff ("KVM: x86: allow L1 to not intercept triple fault")
    Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
